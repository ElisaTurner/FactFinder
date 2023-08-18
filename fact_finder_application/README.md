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
mix run
7. In another terminal window, you can now input facts and queries:
iex
> import FactFinder
> FactFinder.input_fact("is_a_cat (lucy)", [])
> FactFinder.query_facts("is_a_cat (lucy)")
8. The output of the query will be printed to the console.






## Installation

