from lxml import etree

film_library = etree.parse("film_data.xml")
print(film_library)