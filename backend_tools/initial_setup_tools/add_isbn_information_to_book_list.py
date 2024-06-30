import os
from os.path import isfile, join
import pandas as pd

from isbnlib import isbn_from_words, meta, cover

current_working_directory = os.getcwd()
data_dir = join(current_working_directory, 'Data\\csv_files')
book_df = pd.read_csv(join(data_dir, 'barden_book_list.csv'))

# print((meta(isbn)))
# get_google_books_details_using_isbn(isbn, verbose=True)

def get_isbn_for_book(row):

    row_num = row.name
    print(f'Retrieving ISBN Number for Book : {row_num+1} of {len(book_df)}')

    book_text = row['Book']
    author_text = row['Author']

    text = book_text + ' ' + author_text

    query = text.replace(" ", "+")

    try:
        isbn = isbn_from_words(query)
    except:
        isbn = 'Unknown'

    print(f'Author: {author_text} - Book: {book_text} - ISBN: {isbn}')

    return isbn


book_df['ISBN'] = book_df.apply(lambda x: get_isbn_for_book(x), axis=1)

print(book_df)

data_dir = join(current_working_directory, 'Data\\csv_files')
book_df.to_csv(join(data_dir, 'barden_book_list_with_isbn.csv'), index=False)
