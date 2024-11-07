json.array!(@product) do |product|
    json.title product.title
    json.extract! product, :id, :title
    json.link  product_url(product, form: :json)
  end