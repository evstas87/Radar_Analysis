import xml.etree.ElementTree as ET
from inspect import getmembers, isclass, isfunction

# display classes in ET module
for (name, member) in getmembers(ET, isclass):
    if not name.startswith("_"):
        print(name)

# display function in ET module
for (name, member) in getmembers(ET, isfunction):
    if not name.startswith("_"):
        print(name)

    # ET.fromstring(String) --> Elements
    # ET.parse(File)        --> ElementTree
    # ET.tostring(Element)  --> String

tree = ET.parse('tasks.xml')
root = tree.getroot()
print(ET.tostring(root))

# get coin attribute
coin = root.get('coin')
print("Coin attribute is {val}".format(val=coin))

# set launch attribute
root.set('launched', '15.10.21')
print(root.attrib)

# Add id elements to each Investors
id = 1
for investor in tree.findall('investor'):
    investor.set('id', str(id))
    id += 1

# Delete id attributes
for investor in tree.findall('investor'):
    del(investor.attrib['id'])

# Add investor 1
# investor1 = ET.fromstring("<investor>My good friend</investor>")
# root.append(investor1)

# Add investor 2
# investor2 = ET.Element('investor')
# investor2.text = "Another good friend"
# root.append(investor2)

# Add ids id once more
for (id, investor) in enumerate(root.findall('investor')):
    investor.set('id', str(id))

# select Investor 2
investor = root.find(".//investor[@id='1']")
print(investor.text)


# save updated XML
tree.write('tasks.xml')
"""

xml_path = 'c:/Users/evsta/PycharmProjects/PyLearning/venv/PyFile/load_xml/example.xml'
tree = ET.parse(xml_path)
root = tree.getroot()

for child in root:
    print(child.tag, child.attrib)

for neighbor in root.iter('neighbor'):
    print(neighbor.attrib)

for country in root.findall('country'):
    rank = country.find('rank').text
    name = country.get('name')
    print(name, rank)

# update current value with root.iter input to all existing rank
for rank in root.iter('rank'):
    new_rank = int(rank.text) + 1
    rank.text = str(new_rank)
    rank.set('updated', 'yes')

for country in root.findall('country'):
     # using root.findall() to avoid removal during traversal
     rank = int(country.find('rank').text)
     if rank > 50:
        root.remove(country)

for country in root.findall('country'):
    rank = country.find('rank').text
    name = country.get('name')
    print(name, rank)

#tree.write(xml_path)

tree.write('xml_path')
import xml.etree.ElementTree as ET

xml_path = 'c:/Users/evsta/PycharmProjects/PyLearning/venv/PyFile/load_xml/example.xml'
tree = ET.parse(xml_path)
root = tree.getroot()

for child in root:
    print(child.tag, child.attrib)

for neighbor in root.iter('neighbor'):
    print(neighbor.attrib)

for country in root.findall('country'):
    rank = country.find('rank').text
    name = country.get('name')
    print(name, rank)

# update current value with root.iter input to all existing rank
for rank in root.iter('rank'):
    new_rank = int(rank.text) + 1
    rank.text = str(new_rank)
    rank.set('updated', 'yes')

for country in root.findall('country'):
     # using root.findall() to avoid removal during traversal
     rank = int(country.find('rank').text)
     if rank > 50:
        root.remove(country)

for country in root.findall('country'):
    rank = country.find('rank').text
    name = country.get('name')
    print(name, rank)

#tree.write(xml_path)

tree.write('xml_path')


"""