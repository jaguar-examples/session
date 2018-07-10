# session_vanilla

Example showcasing simplicity of using Sessions in Jaguar

# Explanation

This project implements a sample shopping cart application that stores the items in the shopping cart
as session data. 

The HTML page at route `http://localhost:10000/` provides a GUI to interactively add and remove items to the cart.

The API route `/api/add/:phone` adds an item to the cart, while the API route `/api/remove/:phone` removes
the item from the cart.
