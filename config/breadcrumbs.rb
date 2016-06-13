crumb :root do
  link "Главная страница", depot_path
end

crumb :products do
  link "Обои", products_path
end

crumb :product do |product|
  link product.title, product
  parent :products
end

crumb :depot do |product|
	link product.title, product
end

crumb :payment do
  link "Доставка", payment_path
end

crumb :orders do
  link "Мои заказы", personal_orders_path
end

crumb :profile do
  link "Настройки профиля", personal_show_path
end

crumb :cart do
  link "Корзина", cart_path
end

crumb :search do
  link "Результат поиска", depot_search_path
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).