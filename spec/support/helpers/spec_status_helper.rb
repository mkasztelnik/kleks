module SpecStatusHelper
  def expect_ready(page, section)
    expect(page).to have_xpath(
      "//a[@href='/#{section}']/div[@class='pull-right']")
  end
end