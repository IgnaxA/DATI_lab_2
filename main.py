from lxml import etree

xml_doc: etree = etree.parse("film_data.xml")

dtd = etree.DTD("schema/film_library.dtd")
print(f"Result of dtd validation: {dtd.validate(xml_doc)}")

xsd = etree.XMLSchema(etree.parse("schema/film_library.xsd"))
print(f"Result of dtd validation: {xsd.validate(xml_doc)}")

txt_transform = etree.XSLT(etree.parse("xslt/txt.xsl"))
print(txt_transform(xml_doc))

html_transform = etree.XSLT(etree.parse("xslt/html.xsl"))
res = html_transform(xml_doc)

with open("filmLibrary.html", "wb") as f:
    f.write(etree.tostring(res, pretty_print=True))


def exec_query(xml: etree, query: str) -> None:
    print("==================================")
    print(f"Выполнение запроса: {query}")
    result: etree = xml.xpath(query)
    for film in result:
        print(film.find("title").text)

    print("==================================\n")


exec_query(xml_doc, "/filmLibrary/film[genre='Action']")
exec_query(xml_doc, "/filmLibrary/film[count(actor) > 5]")
exec_query(xml_doc, "/filmLibrary/film[producer='Quentin Tarantino' and actor='Quentin Tarantino']")
exec_query(xml_doc, "/filmLibrary/film[genre='Drama']")
exec_query(xml_doc, "/filmLibrary/film[count(genre) > 3 and contains(title, 'Django')]")

