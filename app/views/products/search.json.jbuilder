json.array! @children do |child|
  json.id child.id
  json.name child.name
end

json.array! @grandchildren do |gdchild|
  json.id gdchild.id
  json.name gdchild.name
end