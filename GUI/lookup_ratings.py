from gooey import Gooey, GooeyParser
import matplotlib.pyplot as plt

import pyodbc
#connect to microsoft sql server
conn = pyodbc.connect('Driver={SQL Server};'
                        'Server=LAPTOP-7O5MBOHG\SQLEXPRESS;'
                        'Database=restro;'
                        'Trusted_Connection=yes;')
cursor = conn.cursor()

@Gooey(program_name="Restaurant Ratings Bar Graph")
def main():
    parser = GooeyParser()


    # Fetch restaurant names and total ratings from the database
    cursor.execute("SELECT rname,total_ratings FROM restaurants s INNER JOIN ratings r ON s.restaurant_id = r.restaurant_id")
    data = cursor.fetchall()

    restaurants = [row[0] for row in data]
    total_ratings = [row[1] for row in data]

    # Create a bar graph
    plt.bar(restaurants, total_ratings)
    plt.xlabel("Restaurants")
    plt.ylabel("Total Ratings")
    plt.title("Restaurant Ratings")
    plt.xticks(rotation=45, ha="right")

    plt.tight_layout()
    plt.show()

if __name__ == "__main__":
    main()