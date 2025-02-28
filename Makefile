build:
	@echo "Building the weather tool..."
	python3 -m py_compile weather.py

run:
	@echo "Running the weather tool..."
	python3 weather.py --city "Kathmandu"

