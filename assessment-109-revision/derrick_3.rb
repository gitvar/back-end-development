PRODUCT = [
  { name: "Thinkpad x210", price: 220 },
  { name: "Thinkpad x220", price: 250 },
  { name: "Thinkpad x250", price: 979 },
  { name: "Thinkpad x230", price: 300 },
  { name: "Thinkpad x230", price: 330 },
  { name: "Thinkpad x230", price: 350 },
  { name: "Thinkpad x240", price: 700 },
  { name: "Macbook Leopard", price: 300 },
  { name: "Macbook Air", price: 700 },
  { name: "Macbook Pro", price: 600 },
  { name: "Macbook ", price: 1449 },
  { name: "Dell Latitude", price: 200 },
  { name: "Dell Latitude", price: 650 },
  { name: "Dell Inspiron", price: 300 },
  { name: "Dell Inspiron", price: 450 }
]

query1 = {
  pricemin: 240,
  pricemax: 280,
  q: "thinkpad"
}

query2 = {
  pricemin: 300,
  pricemax: 450,
  q: "dell"
}

def search(qh)
  search_array = []
  search_array =  PRODUCT.select do |hash|
    hash[:price] >= qh[:pricemin] && hash[:price] <= qh[:pricemax] && hash[:name].downcase.include?(qh[:q])
  end
  search_array
end

p search(query1)
p search(query2)