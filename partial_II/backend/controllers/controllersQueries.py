from fpdf import FPDF
import os

class PDF(FPDF):
    def header(self):
        self.set_font('Arial', 'B', 12)
        self.cell(0, 10, 'Logs Generales', 0, 1, 'C')
        self.ln(10)

    def footer(self):
        self.set_y(-15)
        self.set_font('Arial', 'I', 8)
        self.cell(0, 10, f'Page {self.page_no()}', 0, 0, 'C')

class ControllersQueries:
    def __init__(self, db_manager):
        self.db_manager = db_manager


    def clean_user_host(self, user_host):
        return user_host.split('[')[1].split(']')[0]

    def generate_pdf_report(self, query_results, filename):
        # Crear un objeto PDF en orientación horizontal (L = Landscape)
        pdf = PDF('L', 'mm', 'A3')
        pdf.set_auto_page_break(auto=True, margin=15)
        pdf.add_page()
        pdf.set_font("Arial", size=11)

        # Encabezados de la tabla
        headers = ['Event Time', 'User Host', 'Thread ID', 'Server ID', 'Command Type', 'Argument']
        col_width = pdf.w / 6.5  # Ancho de columna
        row_height = pdf.font_size * 2.5
        row_height2 = pdf.font_size * 3.5
        # Agregar encabezados
        for header in headers:
            pdf.cell(col_width, row_height, header, border=1)
        pdf.ln(row_height)

        # Agregar resultados de la consulta a la tabla
        for result in query_results:
            event_time = result[0].strftime('%Y-%m-%d %H:%M:%S')
            user_host = self.clean_user_host(result[1])
            thread_id = str(result[2])
            server_id = str(result[3])
            command_type = result[4]
            argument = result[5]
            # Crear una fila de celdas lado a lado
            pdf.cell(col_width, row_height2, event_time, border=1)
            pdf.cell(col_width, row_height2, user_host, border=1)
            pdf.cell(col_width, row_height2, thread_id, border=1)
            pdf.cell(col_width, row_height2, server_id, border=1)
            pdf.cell(col_width, row_height2, command_type, border=1)
            pdf.cell(col_width, row_height2, argument, border=1)
            pdf.ln(row_height2)
        # Directorio de salida para el PDF
        output_dir = "output"
        if not os.path.exists(output_dir):
            os.makedirs(output_dir)

        # Ruta completa del archivo PDF
        pdf_output = os.path.join(output_dir, f"{filename}.pdf")

        # Guardar PDF en la ruta especificada
        pdf.output(pdf_output)

        return pdf_output
