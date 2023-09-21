# How to solve a problem:

#     -Figure out wher the input and its type are
#     -Set up a function
#     -Figure out what the output and its type are
#     -Gather your Knowledge
#     -Gathers your contraints (Not Always Necessary)
#     -Determine a Logical way to solve the problem
#      -Write each step out in English
#       -Write each step out in Python-esse (sudo-code)
#       -Invoke and Test your function
'''
  # You probably know the "like" system from Facebook and other pages.
    #People can "like" blog posts, pictures or other items. 
    #We want to create the text that should be displayed next to such an item.

    # Implement the function which takes an array containing the names of people that like an item.
    # The given array's names will always be valid, and will not contain any numbers or special characters.
    #  It must return the display text as shown in the examples:

    # []                                -->  "no one likes this"
    # ["Peter"]                         -->  "Peter likes this"
    # ["Jacob", "Alex"]                 -->  "Jacob and Alex like this"
    # ["Max", "John", "Mark"]           -->  "Max, John and Mark like this"
    # ["Alex", "Jacob", "Mark", "Max"]  -->  "Alex, Jacob and 2 others like this"
    # Note: For 4 or more names, the number in "and 2 others" simply increases.
'''
# To implement the function, you can use the length of the list of names to determine which format to return.

#     If the list is empty, return "no one likes this".
#     If the list contains one name, return "{name} likes this".
#     If the list contains two names, return "{name1} and {name2} like this".
#     If the list contains three names, return "{name1}, {name2} and {name3} like this".
#     If the list contains four or more names, return "{name1}, {name2} and {number of remaining names} others like this".

# n = ["Milad"], 
#n = ["Toby", "Alex"]
#  n = ["Lyla", "Porter", "Tim"], 
#  n = ["Alex", "Jacob", "Mark", "Max"]

def like_me(names):
    n = len(names)
    if n == 0:
        return "no one likes this"
    elif n == 1:
        return f'{names[0]} likes this'
    elif n == 2:
        return f'{names[0]} and {names[1]} like this'
    elif n == 3:
        return f'{names[0]} and {names[1]} and {names[2]} like this'
    else:
        return f'{names[0]} and {names[1]} and {n - 2} others like this'

total_likes = like_me(n)
print(total_likes)