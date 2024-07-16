from gooey import Gooey, GooeyParser
import subprocess

@Gooey(program_name="Restaurant Review App")
def main():
    parser = GooeyParser()
    
    parser.add_argument("menu_option", choices=["Submit Review", "Lookup Ratings"], metavar="Select Option", help="Select an option to continue.")
    
    args = parser.parse_args()

    if args.menu_option == "Submit Review":
        subprocess.run(["python", "submit_review.py"])
    elif args.menu_option == "Lookup Ratings":
        subprocess.run(["python", "lookup_ratings.py"])

if __name__ == "__main__":
    main()
