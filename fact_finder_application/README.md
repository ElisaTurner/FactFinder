# FactFinder

Use this application to input and query facts. 

1. Install Elixir.
2. Clone the repository:
git clone https://github.com/shantanuray/fact_finder_application.git
3. Navigate to the directory:
4. cd fact_finder_application
5. Run the following command to compile the code:
 mix compile
6. Run the following command to start the server:
iex -S mix
7. You can now input facts and queries:
iex
> import FactFinder
> import FactMap
> FactFinder.input_fact("is_a_cat (lucy)")
> FactFinder.query_facts("is_a_cat (lucy)")
8. The output of the query will be printed to the console. if the input and query match it will be true. 
9. you can also delete facts by doing 
> FactFinder.delete_fact("is_a_cat (lucy)")
when you query again the fact will be false.  






## Installation

