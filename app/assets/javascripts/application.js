//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

const stripeTokenHandler = (token) => {
    let stripeForm = document.getElementById('rental_form')
    const hiddenInput = document.createElement('input')
    hiddenInput.setAttribute('type', 'hidden')
    hiddenInput.setAttribute('name', 'stripeToken')
    hiddenInput.setAttribute('value', token.id)
    stripeForm.appendChild(hiddenInput)

    stripeForm.submit()
}

const initiateStripe = () => {
    console.log('hej')
    const stripe = Stripe('pk_test_QicERB8w3kyqaYW3hUUQylRH');
    const elements = stripe.elements();
    const card = elements.create('card')
    card.mount('#card-element');
    const form = document.getElementById('rental_form');
    form.addEventListener('submit', () => {
        event.preventDefault();
        stripe.createToken(card).then(result =>{
            stripeTokenHandler(result.token)
        })
    })
}

document.addEventListener('turbolinks:load', ()=>{
    let stripeForm = document.getElementById('rental_form')
    if (stripeForm){
        initiateStripe()
    }
})