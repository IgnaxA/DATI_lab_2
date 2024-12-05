from lxml import etree
import random

xml_doc: etree = etree.parse("film_data.xml")

dtd = etree.DTD("schema/film_library.dtd")
print(f"Result of dtd validation: {dtd.validate(xml_doc)}")

xsd = etree.XMLSchema(etree.parse("schema/film_library.xsd"))
print(f"Result of dtd validation: {xsd.validate(xml_doc)}")

txt_transform = etree.XSLT(etree.parse("xslt/txt.xsl"))
res = txt_transform(xml_doc)
with open("filmLibrary.txt", "wb") as f:
    f.write(res)

html_transform = etree.XSLT(etree.parse("xslt/html.xsl"))
res = html_transform(xml_doc)
with open("filmLibrary.html", "wb") as f:
    f.write(etree.tostring(res, pretty_print=True))


def exec_query(xml: etree, query: str, is_random: bool = False) -> None:
    print("==================================")
    print(f"Выполнение запроса: {query}")
    result: etree = xml.xpath(query)
    res = []

    for film in result:
        res.append(film.find("title").text)

    if is_random:
        random.shuffle(res)

    for film in res:
        print(film)

    print("==================================\n")


exec_query(xml_doc, "/filmLibrary/film[genre='Action']")
exec_query(xml_doc, "/filmLibrary/film[count(actor) > 5]")
exec_query(xml_doc, "/filmLibrary/film[producer='Quentin Tarantino' and actor='Quentin Tarantino']")
exec_query(xml_doc, "/filmLibrary/film[genre='Drama']", True)
exec_query(xml_doc, "/filmLibrary/film[count(genre) > 3 and contains(title, 'Django')]")

