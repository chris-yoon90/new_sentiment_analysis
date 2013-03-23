def searchType(type)
  visit root_path
  fill_in "keyword", with: "Google"
  choose "search_type_#{type}"
  click_button "Search"
end
