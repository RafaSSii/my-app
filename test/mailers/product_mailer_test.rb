require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    product = Product.new(name: "Café")
    subscriber = OpenStruct.new(mail: "to@example.org")

    mail = ProductMailer.with(product: product, subscriber: subscriber).in_stock

    assert_equal "In stock", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Café", mail.body.encoded
  end
end
