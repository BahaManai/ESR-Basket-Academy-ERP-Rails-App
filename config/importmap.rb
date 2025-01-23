# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "custom", to: "custom.js"
pin "jquery", to: "https://code.jquery.com/jquery-3.6.0.min.js"
pin "datatables.min", to: "datatables.min.js"
pin "flatpickr", to: "https://cdn.jsdelivr.net/npm/flatpickr"
pin "flatpickr/plugins/monthSelect", to: "https://cdn.jsdelivr.net/npm/flatpickr@4.6.13/dist/plugins/monthSelect/index.js"
pin "flatpickr/dist/l10n/fr", to: "https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/fr.js"
pin "bootstrap.bundle.min", to: "bootstrap.bundle.min.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "chartkick", to: "chartkick.js"
