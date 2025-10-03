require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    product = Product.create!(name: "Fulano", inventory_count: 10)
    subscriber = Subscriber.create!(mail: "to@example.org")

    mail = ProductMailer.with(product: product, subscriber: subscriber).in_stock

    assert_equal "Product avaliable in stock!", mail.subject
    assert_equal [ subscriber.mail ], mail.to
    assert_equal [ "from@example.com" ], mail.from
    assert_match product.name, mail.body.encoded
  end
end
