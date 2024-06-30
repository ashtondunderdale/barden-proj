from azure.data.tables import TableServiceClient
from azure.core.credentials import AzureNamedKeyCredential
from flet import Flet

from get_book_data_from_isbn import get_book_meta_data_from_isbn

# flutter run -d chrome --web-brecordser-flag "--disable-web-security"

from secret_keys import account_name, key, endpoint

ACCOUNT_NAME = account_name
KEY = key
ENDPOINT = endpoint


@Flet.register_function
def my_python_function(param):
    print(f'Received from Flutter: {param}')
    # Add your Python logic here


def authenticate_with_table_service(account_name, key, endpoint):

    credential = AzureNamedKeyCredential(account_name, key)

    service = TableServiceClient(endpoint=endpoint, credential=credential)
    books_table = service.get_table_client('bookinventory')

    return books_table


def create_book_copy_record(isbn: str, category: str, reading_year: str,
                            n_copies: int):

    # get book metadata from isbn
    book_metadata = get_book_meta_data_from_isbn(isbn)

    book_title = book_metadata['title']
    author = book_metadata['author']
    publisher = book_metadata['publisher']
    year = book_metadata['year']
    language = book_metadata['language']
    cover_url = book_metadata['cover_url_thumbnail']

    lexile_level = '770L'
    bl_score = 2.2
    summary = 'Summary! Here is the summary.'

    record = {
        'PartitionKey': '1',
        'RowKey': isbn,
        'ISBN': isbn,
        'Author': author,
        'Title': book_title,
        'Category': category,
        'Reading_Year': reading_year,
        'Lexile_Level': lexile_level,
        'BL_Score': bl_score,
        'Publisher': publisher,
        'Release_Year': year,
        'Language': language,
        'Summary': summary,
        'Number_Of_Copies': n_copies,
        'Cover': cover_url
    }

    return record


def add_record_to_table(record, table):

    "Adds record to table."

    table.create_entity(record)


def add_book_copy(isbn, category, reading_year, n_copies):

    books_table = authenticate_with_table_service(ACCOUNT_NAME, KEY, ENDPOINT)

    # check if a book copy of this already exists - if the categories
    # also match then simply increment n_copies
    # otherwise create new record

    book_copy_record = create_book_copy_record(isbn, category, reading_year, n_copies)
    print(book_copy_record)
    add_record_to_table(book_copy_record, books_table)


# test
add_book_copy('9780008293338', 'TESTING', 'EYFS', 3)
