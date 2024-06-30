import os
import pandas as pd
from os.path import join
from isbnlib import isbn_from_words, meta, cover


def get_book_meta_data_from_isbn(row):

    row_num = row.name
    print(f'Retrieving ISBN Number for Book : {row_num+1} of {len(book_df)}')

    isbn = str(row['ISBN']).strip()
    title = authors = publisher = year = language = cover_url_thumbnail = cover_url_small_thumbnail = 'Unknown'

    try:
        meta_data = meta(isbn)
    except:
        meta_data = {}

    # TODO
    # check if all keys exist? error message

    try:
        meta_title = meta_data['Title'].strip()
        if meta_title:
            title = meta_title
    except KeyError:
        pass

    try:
        meta_authors = ' & '.join(meta_data['Authors']).strip()
        if meta_authors:
            authors = meta_authors
    except KeyError:
        pass

    try:
        meta_publisher = meta_data['Publisher'].strip()
        if meta_publisher:
            publisher = meta_publisher
    except KeyError:
        pass

    try:
        meta_year = meta_data['Year'].strip()
        if meta_year:
            year = meta_year
    except KeyError:
        pass

    try:
        meta_language = meta_data['Language'].strip()
        if meta_language:
            language = meta_language
    except KeyError:
        pass

    try:
        meta_cover_url_thumbnail = cover(isbn)['thumbnail'].strip()
        if meta_cover_url_thumbnail:
            cover_url_thumbnail = meta_cover_url_thumbnail
    except KeyError:
        pass

    try:
        meta_cover_url_small_thumbnail = cover(isbn)['smallThumbnail'].strip()
        if meta_cover_url_small_thumbnail:
            cover_url_small_thumbnail = meta_cover_url_small_thumbnail
    except KeyError:
        pass

    verbose = True
    if verbose:
        print(f'ISBN: {isbn} - Title: {title} - Author(s): {authors} - Publisher: {publisher} - Year: {year} - Language - {language}  - Cover URL Small Thumbnail: {cover_url_small_thumbnail}')

    return title, authors, publisher, year, language, cover_url_thumbnail, cover_url_small_thumbnail

# obj = {'ISBN': 9780747532743}
# get_book_meta_data_from_isbn(obj)


current_working_directory = os.getcwd()
data_dir = join(current_working_directory, 'Data\\csv_files')
book_df = pd.read_csv(join(data_dir, 'barden_book_list_with_isbn.csv'))

book_df.rename(columns={'Year': 'Reading Year'}, inplace=True)

# book_df = book_df.head(50)

book_df['Metadata Title'], book_df['Metadata Author'], book_df['Metadata Publisher'], book_df['Metadata Year'], book_df['Metadata Language'], book_df['Metadata Cover URL Thumbnail'], book_df['Metadata Cover URL Small Thumbnail'] = zip(*book_df.apply(lambda x: get_book_meta_data_from_isbn(x), axis=1))
book_df['Number Of Copies'] = 1

print(book_df)

# create csv from list
data_dir = join(current_working_directory, 'Data\\csv_files')
book_df.to_csv(join(data_dir, 'barden_book_list_with_isbn_and_metadata.csv'),
               index=False)
