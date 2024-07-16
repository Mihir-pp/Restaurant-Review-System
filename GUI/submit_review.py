from gooey import Gooey, GooeyParser
import pyodbc
#connect to microsoft sql server
conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7O5MBOHG\SQLEXPRESS;'
                        'Database=restro;'
                        'Trusted_Connection=yes;')
cursor = conn.cursor()
@Gooey(program_name="Restaurant Review System")
def main():
    parser = GooeyParser()

    parser.add_argument('username',action="store", help='Enter your username')
    parser.add_argument("city",action="store", help='Enter your city')
    parser.add_argument("restaurant_name", choices = ["Restaurant A", "Restaurant B", "Restaurant C", "Restaurant D", "Restaurant E", "Restaurant F", "Restaurant G", "Restaurant H", "Restaurant I", "Restaurant J"],metavar ="Restaurant Name", action="store", help='Select a restaurant')
    parser.add_argument("rating", choices = ["1", "2", "3", "4", "5"],metavar ="Rating", action="store", help='Select a rating')
    parser.add_argument("review_text",widget="Textarea",metavar ="Review", action="store", help='Enter your review')
    args = parser.parse_args()
    
    # Store user inputs in variables
    username = args.username
    city = args.city
    restaurant_name = args.restaurant_name
    rating = args.rating
    review_text = args.review_text
    cursor.execute("SELECT UserID FROM users WHERE username = ?", username)
    user_row = cursor.fetchone()

    if user_row:
         # User exists, get the existing UserID
         user_id = user_row.UserID
    else:
        # User does not exist, create a new user
        cursor.execute("INSERT INTO users (username, city) VALUES (?, ?)", (username, city))
        cursor.execute("SELECT @@IDENTITY AS newUserid")
        user_id = cursor.fetchone().newUserid
            

    # Fetch the restaurant ID based on the selected restaurant name
    cursor.execute("SELECT restaurant_id FROM restaurants WHERE rname = ?", restaurant_name)
    restaurant_row = cursor.fetchone()
    if restaurant_row:
        restaurant_id = restaurant_row.restaurant_id
    else:
        # Handle the case where the restaurant doesn't exist
        restaurant_id = None  # You can add appropriate error handling
    #fetch system date from data base using gate date function into review_date
    cursor.execute("SELECT GETDATE() AS review_date")
    review_date = cursor.fetchone().review_date

    # Insert the review
    cursor.execute("INSERT INTO reviews (user_id, username, restaurant_id, rname, rating, city, review_text, review_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)",
                (user_id, username, restaurant_id, restaurant_name, rating, city, review_text, review_date))
    
    print("Review Submitted, Thank you! for your review")

    # Commit the transaction
    conn.commit()


    

if __name__ == '__main__':
    main()



    
