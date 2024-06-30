import urllib.request
import json
import textwrap

def get_google_books_details_using_isbn(isbn, verbose=False):

    base_api_link = "https://www.googleapis.com/books/v1/volumes?q=isbn:"

    with urllib.request.urlopen(base_api_link + isbn) as f:
        text = f.read()

    decoded_text = text.decode("utf-8")
    obj = json.loads(decoded_text)
    volume_info = obj["items"][0]
    authors = obj["items"][0]["volumeInfo"]["authors"]

    title = volume_info["volumeInfo"]["title"]
    summary = textwrap.fill(volume_info["searchInfo"]["textSnippet"], width=65)
    author = " & ".join(authors)
    public_domain = volume_info["accessInfo"]["publicDomain"]
    page_count = volume_info["volumeInfo"]["pageCount"]
    language = volume_info["volumeInfo"]["language"]

    if verbose:
        print("\nTitle:", title)
        print("\nSummary:\n")
        print(summary)
        print("\nAuthor(s):", author)
        print("\nPublic Domain:", public_domain)
        print("\nPage count:", page_count)
        print("\nLanguage:", language)
        print("\n***")

    return title, summary, author, public_domain, page_count, language

# Test
isbn = str(9780241378502)
isbn = str(9780006479888)
get_google_books_details_using_isbn(isbn, verbose=True)
