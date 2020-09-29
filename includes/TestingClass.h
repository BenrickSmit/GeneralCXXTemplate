
#pragma once

class TestingClass {

	public:
		TestingClass(int input);
		~TestingClass();

		int get_value();

	private:
		int m_stored_value;

};