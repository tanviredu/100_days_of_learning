import json
from employee import *

def create_dict(name, age, title):
    d = {
        "first_name": str(name),
        "age": int(age),
        "title": str(title)
    }
    return d


def write_json_to_file(json_obj, output_file):
    with open(output_file, 'w') as file:
        file.write(json_obj);

def main():
    details()
    employee_dict = create_dict(employee_name, age, title)
    print("employee_dict: " + str(employee_dict))
    json_object = json.dumps(employee_dict)
    print("json_object: " + str(json_object))
    write_json_to_file(json_object, "employee.json")

if __name__ == "__main__":
    main()