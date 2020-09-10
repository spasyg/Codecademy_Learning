# This project practices merging of tables in Pandas to build a page
# visits funnel for a fictional t-shirt company

import codecademylib
import pandas as pd

visits = pd.read_csv('visits.csv',
                     parse_dates=[1])
cart = pd.read_csv('cart.csv',
                   parse_dates=[1])
checkout = pd.read_csv('checkout.csv',
                       parse_dates=[1])
purchase = pd.read_csv('purchase.csv',
                       parse_dates=[1])

print(visits.head(10))
print(cart.head(10))
print(checkout.head(10))
print(purchase.head(10))

visits_cart = pd.merge(visits, cart, how='left')
print(visits_cart.head(10))
print('The length of the merged visits and cart table in rows is ' + str(len(visits_cart)))

null_cart_time = visits_cart[visits_cart.cart_time.isnull()]
print('the number of visits that did not proceed to the cart is ' + str(len(null_cart_time)))

percent_cart = (float(len(null_cart_time))/len(visits_cart)) * 100
print('the percentage of visits who did not proceed to cart is ' + str(percent_cart))

cart_checkout = pd.merge(cart, checkout, how='left')
print(cart_checkout.head(10))
print('The length of the merged cart and checkout table in rows is ' + str(len(cart_checkout)))

null_checkout_time = cart_checkout[cart_checkout.checkout_time.isnull()]
print('the number of carts that did not proceed to checkout is ' + str(len(null_checkout_time)))

percent_checkout = (float(len(null_checkout_time))/len(cart_checkout)) * 100
print('the percentage of carts who did not proceed to checkout is ' + str(percent_checkout))

all_data = visits.merge(cart, how='left').merge(checkout, how='left').merge(purchase, how='left')
print(all_data.head(30))

visit_site = all_data[all_data.visit_time.notnull()]
print('The number of people who visited the site is ' + str(len(visit_site)))

null_visit_cart = visit_site[visit_site.cart_time.isnull()]
print('The number of people who visit the website but place nothing in the cart is ' + str(len(null_visit_cart)))

percent_no_cart = (float(len(null_visit_cart))/len(visit_site)) * 100
print('The percentage of people who visit the website but place nothing in the cart is ' + str(percent_no_cart))

proceed_cart = all_data[all_data.cart_time.notnull()]
print('The number of people who proceed to the cart is ' + str(len(proceed_cart)))

null_cart_checkout = proceed_cart[proceed_cart.checkout_time.isnull()]
print('The number of people who place something in the cart but do not checkout is ' + str(len(null_cart_checkout)))

percent_no_checkout = (float(len(null_cart_checkout))/len(proceed_cart)) * 100
print('The percentage of people who place something in the cart but do not checkout is ' + str(percent_no_checkout))

proceed_checkout = all_data[all_data.checkout_time.notnull()]
print('The number of people who proceed to the checkout is ' + str(len(proceed_checkout)))

null_checkout_purchase = proceed_checkout[proceed_checkout.purchase_time.isnull()]
print('The number of people who proceed to the checkout but do not make a purchase is ' + str(len(null_checkout_purchase)))

percent_no_purch = (float(len(null_checkout_purchase))/len(proceed_checkout)) * 100
print('The percentage of people who proceed to the checkout but do not make a purchase is ' + str(percent_no_purch))

all_data['time_to_purchase'] = \
    (all_data.purchase_time - \
    all_data.visit_time)
print(all_data.head(10))
print('The mean time from site visit to purchase is ' + str(all_data.time_to_purchase.mean()))
