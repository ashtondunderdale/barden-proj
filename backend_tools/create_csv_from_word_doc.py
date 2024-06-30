import os
from os import listdir
from os.path import isfile, join

from io import StringIO
from docx import Document

import pandas as pd

import re

years = range(1, 7)
year_map = {}
for year in years:
    year_map[year] = f'Year {year}'
print(year_map)

current_working_directory = os.getcwd()
data_dir = join(current_working_directory, 'Data\\word_files')

# reading challenge books
onlyfiles = [f for f in listdir(data_dir) if isfile(join(data_dir, f))]
reading_challenge_files = [x for x in onlyfiles if 'Challenge Book' in x]

# reading_challenge_files = reading_challenge_files[2:3]

book_dict_list = []
for book_list in reading_challenge_files:

    if 'EYFS' in book_list:
        rc_year = 'EYFS'
    else:
        rc_year = re.search('\d{1}', book_list).group()[0]

    filepath = join(data_dir, book_list)
    f = open(filepath, 'rb')
    document = Document(f)

    for table in document.tables:
        for row in table.rows:

            book = row.cells[0].text
            author = row.cells[1].text

            author = author.replace('’', "'")
            book = book.replace('’', "'")

            author = author.replace('*', '')
            book = book.replace('*', '')

            author = author.replace('–', '-')
            book = book.replace('–', '-')

            author = author.replace('…', '...')
            book = book.replace('…', '...')

            author = author.strip()
            book = book.strip()

            # print(f'Author: {author}, Book: {book}')
            book_item = {'Author': author,
                         'Book': book,
                         'Category': 'Reading Challenge',
                         'Year': rc_year}
            book_dict_list.append(book_item)

            print(book_item)

    f.close()

book_df = pd.DataFrame.from_records(book_dict_list,
                                    index=list(range(len(book_dict_list))))

# drop incorrect records
book_df = book_df[book_df['Author'] != 'Author']
book_df = book_df[book_df['Author'] != 'EYFS']
book_df = book_df[~book_df['Author'].isin(year_map.values())]

# print(book_df)

# create csv from list
data_dir = join(current_working_directory, 'Data\\csv_files')
book_df.to_csv(join(data_dir, 'barden_book_list.csv'), index=False)
