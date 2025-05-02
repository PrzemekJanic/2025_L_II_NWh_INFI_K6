from hello_world import app
from hello_world.formater import add_numbers

result = add_numbers(10, 5)  
print(result)

if __name__ == "__main__":
    app.run()
