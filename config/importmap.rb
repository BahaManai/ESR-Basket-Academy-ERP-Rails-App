# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap.bundle.min", to: "bootstrap.bundle.min.js"
pin "custom", to: "custom.js"
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"
pin "datatables.min", to: "datatables.min.js"
