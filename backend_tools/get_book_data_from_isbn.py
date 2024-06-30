from isbnlib import meta, cover


def get_book_meta_data_from_isbn(isbn: str) -> dict:

    print(f'Retrieving book Information For ISBN Number {isbn}')
    isbn = isbn.strip()

    title = authors = publisher = year = language = cover_url_thumbnail = cover_url_small_thumbnail = 'Unknown'

    try:
        meta_data = meta(isbn)
    except:
        meta_data = {}

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

    verbose = False
    if verbose:
        print(f'ISBN: {isbn} - Title: {title} - Author(s): {authors} - Publisher: {publisher} - Year: {year} - Language - {language}  - Cover URL Small Thumbnail: {cover_url_small_thumbnail}')

    book_record = {'title': title, 'author': authors, 'publisher': publisher,
                   'year': year, 'language': language,
                   'cover_url_thumbnail': cover_url_thumbnail,
                   'cover_url, small_thumbnail': cover_url_small_thumbnail}

    return book_record

# test
isbn_test = '9780008293338'
book_record = get_book_meta_data_from_isbn(isbn_test)
print(book_record)
