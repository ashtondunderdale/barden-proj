import os
import pandas as pd
from os.path import join

from azure.data.tables import TableServiceClient
from azure.core.credentials import AzureNamedKeyCredential

# flutter run -d chrome --web-browser-flag "--disable-web-security"

from secrets import account_name, key, endpoint

current_working_directory = os.getcwd()
data_dir = join(current_working_directory, 'Data\\csv_files')
book_df = pd.read_csv(join(data_dir, 'barden_book_list_with_isbn_and_metadata.csv'))

print(book_df.columns)


def authenticate_with_table_service(account_name, key, endpoint):

    credential = AzureNamedKeyCredential(account_name, key)

    service = TableServiceClient(endpoint=endpoint, credential=credential)
    books_table = service.get_table_client('bookinventory')

    return books_table


def create_record_from_df_row(row):

    isbn = str(row['ISBN'])
    book_title = row['Metadata Title']
    author = row['Metadata Author']
    reading_year = row['Reading Year']
    category = row['Category']
    publisher = row['Metadata Publisher']
    year = row['Metadata Year']
    language = row['Metadata Language']
    cover_url = row['Metadata Cover URL Thumbnail']

    lexile_level = 770
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
        'Number_Of_Copies': 1,
        'Cover': cover_url
    }

    return record


def add_record_to_table(record, table):

    "Adds record to table."

    table.create_entity(record)

# books = books_table.query_entities(query_filter="PartitionKey eq '1'")
# for book in books:
#     print(book["RowKey"])
    
book_df['azure_table_record'] = book_df.apply(lambda x : create_record_from_df_row(x), axis=1)
print(book_df['azure_table_record'])

books_table = authenticate_with_table_service(account_name, key, endpoint)

for index, row in book_df.iterrows():

    record = row['azure_table_record']
    print(record)
    add_record_to_table(record, books_table)
