#booking page elements
txt_box_from=  "id:frmcity"
#xpath://div[@id='frmcity']
clear_element_from = "xpath://input[@id='a_FromSector_show']"
from_location_txt= "xpath://input[@id='a_FromSector_show']"
from_location_click = "xpath://span[@id='spnChennai']"
#//span[@id='spnChennai']
#//span[text()='Chennai(MAA)']
#//span[contains(text(),'Chennai(MAA)')]  spnMumbai

#to location

txt_box_to=  "//input[@id='a_Editbox13_show']"
#//input[@id='a_Editbox13_sho']
#clear_element_to = "xpath://input[@id='a_Editbox13_show']"
to_location_txt= "xpath://input[@id='a_Editbox13_show']"
to_location_click = "xpath://span[@id='spnMumbai']"
# //span[text()='Mumbai(BOM)']
date= "id=fiv_5_28/02/2025"
#xpath: //li[@id='fiv_2_31/12/2024']
searchBtn = "xpath://button[@class='srchBtnSe']"

fare_details = "xpath=//div[@class='fareflex']//span[contains(@id,'spnPrice')]"
# xpath=//div[@class='col-md-10 col-sm-8 col-xs-9 txt-r6-n exPrc 11']
# xpath=//div[@class='txt-r6-n ng-scope']
# xpath: //div[@ng-if="IsGroupQuery==false"]//child::span

#booking details page
radio_button="xpath: //input[@id='chkInsurance']"
email_text= "xpath=//input[@id='txtEmailId']"
continue_booking_button = "xpath: //span[@id='spnVerifyEmail']"
first_name_field="xpath: //div[@class='str_3 mrel']//input[@placeholder='Enter First Name']"
plus_button="xpath: //div[@id='divFlyerPlusAdult0']"
meal_preference="xpath: //select[@id='txtFFMealAdult0']"
baby_meal = "xpath: //option[@value='Baby Meal']"

