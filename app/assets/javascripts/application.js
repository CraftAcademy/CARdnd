// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .


document.addEventListener('turbolinks:load', () => {
    var form = document.getElementById('create_automobile')

    if (form) {
        var brandSelect = document.getElementById('automobile_brand_id')
        var yearSelect = document.getElementById('automobile_year')
        var modelSelectWrapper = document.getElementById('automobile_model_wrapper')

        yearSelect.style.display = 'none'

        brandSelect.addEventListener('change', () => {
            yearSelect.style.display = ''
        })


        yearSelect.addEventListener('change', () => {
            var params = `brand_id=${brandSelect.options[brandSelect.selectedIndex].value}&year=${yearSelect.options[yearSelect.selectedIndex].value}`
            Rails.ajax({
                type: 'GET',
                url: '/get_models',
                data: params,
                success: (response) => {
                    modelSelectWrapper.innerHTML = response.html;
                    let selector = document.getElementById('automobile_model_id')
                    selector.addEventListener('change', () => {
                        let brand = brandSelect.options[brandSelect.selectedIndex].text
                        let model = selector.options[selector.selectedIndex].text
                        let hiddenBrand = document.getElementById('automobile_brand')
                        let hiddenModel = document.getElementById('automobile_model')
                        hiddenBrand.value = brand
                        hiddenModel.value = model
                    })
                }
            })
        })
    }

})
