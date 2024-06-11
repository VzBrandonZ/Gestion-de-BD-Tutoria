from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Table, TableStyle, Paragraph
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet

class ControllersReportGenerator:
    def __init__(self, db_manager, controllersQueryBuilder):
        self.db_manager = db_manager
        self.controllersQueryBuilder = controllersQueryBuilder

    def executeQuery(self):
        try:
            query = self.controllersQueryBuilder.buildQuery()
            cursor = self.db_manager.connection.cursor()
            cursor.execute(query)
            results = cursor.fetchall()
            cursor.close()
            return results
        except Exception as e:
            print(f"Error al ejecutar la consulta: {e}")
            return []

    def generatePdfReport(self, filename):
        try:
            if not self.controllersQueryBuilder:
                raise ValueError("No hay atributos ni entidades agregadas")

            if not filename:
                raise ValueError("archivo pdf no puede ser vacío")

            results = self.executeQuery()
            attributeList = self.controllersQueryBuilder.listAttribute()

            # Convertir los resultados en una lista de listas
            data = [attributeList]  # Encabezados
            data.extend(results)    # Filas de datos

            # Crear el documento PDF
            doc = SimpleDocTemplate(filename + ".pdf", pagesize=letter)
            elements = []

            # Agregar título
            styles = getSampleStyleSheet()
            title = Paragraph("<b>Reporte de la Base de Datos</b>", styles['Title'])
            elements.append(title)
            elements.append(Paragraph("<br/><br/>", styles['Normal']))  # Espacio después del título

            # Crear la tabla
            table = Table(data)

            # Estilo de la tabla
            style = TableStyle([('BACKGROUND', (0, 0), (-1, 0), colors.aquamarine),
                                ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
                                ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
                                ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
                                ('BOTTOMPADDING', (0, 0), (-1, 0), 12),
                                ('BACKGROUND', (0, 1), (-1, -1), colors.white),
                                ('GRID', (0, 0), (-1, -1), 1, colors.black)])

            # Aplicar el estilo a la tabla
            table.setStyle(style)
            elements.append(table)

            # Construir el PDF
            doc.build(elements)
            print(f"Reporte generado exitosamente: {filename}.pdf")
        except ValueError as ve:
            print(f"Error de validación: {ve}")
        except Exception as e:
            print(f"Error al generar el reporte PDF: {e}")
