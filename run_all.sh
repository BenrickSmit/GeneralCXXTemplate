start_var="START TEST EXECUTION:"
middle_var="START APPLICATION EXECUTION"
last_var="FINISHED TEST AND APPLICATION EXECUTION"
line="=================================================="

echo ""
echo "${line}"
echo "${start_var}"
echo "${line}"
echo ""
./run_tests.sh && echo "" && echo "${line}" && echo "${middle_var}" && echo "${line}" && echo "" && ./run_application.sh && ./init_documentation
echo ""
echo "${line}"
echo "${last_var}"
echo "${line}"
echo ""
