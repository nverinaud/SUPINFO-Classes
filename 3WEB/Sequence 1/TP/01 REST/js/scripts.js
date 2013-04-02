/* Loading */

document.body.onload = onDocumentLoad;


function onDocumentLoad()
{
	var POLLING_TIME_INTERVAL = 10000;

	var addStudentForm = document.getElementById('add-student');
	addStudentForm.onsubmit = function (e) {
		onFormSubmitForAddingStudent(this);
		e.preventDefault();
	}

	fetchStudents();
	window.setInterval(fetchStudents, POLLING_TIME_INTERVAL);
}


/* Students API */

var RESTFUL_STUDENTS_API = "http://restful-example.appspot.com";

function fetchStudents()
{
	var studentsView = document.getElementById('students-tbody');
	var loader = document.getElementById('loader');

	loader.style.visibility = 'visible';

	getStudents(function(students) {

		studentsView.innerHTML = '';

		students.forEach(function(student) {
			insertStudentInTable(student);
		});

		loader.style.visibility = 'hidden';
	});
}


function onFormSubmitForAddingStudent(form)
{
	var student = {};
	student.idBooster = document.getElementById('input-idBooster').value;
	student.firstName = document.getElementById('input-firstName').value;
	student.lastName = document.getElementById('input-lastName').value;
	student.birthDate = new Date();

	createStudent(student, function(s) {
		insertStudentInTable(s);
	});
}


function insertStudentInTable(student)
{
	var studentsView = document.getElementById('students-tbody');
	var row = studentAsHTMLTableRow(student);
	studentsView.appendChild(row);
}


function studentAsHTMLTableRow(student)
{
	var tr = document.createElement('tr');
	var td;

	/* id booster */
	td = document.createElement('td');
	td.innerHTML = student.idBooster;
	tr.appendChild(td);

	/* first name */
	td = document.createElement('td');
	td.innerHTML = student.firstName;
	tr.appendChild(td);

	/* last name */
	td = document.createElement('td');
	td.innerHTML = student.lastName;
	tr.appendChild(td);

	/* birth date */
	td = document.createElement('td');
	td.innerHTML = student.birthDate;
	tr.appendChild(td);

	/* Actions */
	td = document.createElement('td');
	var a = document.createElement('a');
	a.href = RESTFUL_STUDENTS_API + '/students/' + student.idBooster;
	a.innerHTML = 'Delete';
	a.onclick = function (e) {
		tr.parentNode.removeChild(tr);
		deleteStudent(this.href);
		e.preventDefault();
	}

	td.appendChild(a);
	tr.appendChild(td);

	return tr;
}


function getStudents(onStudentsLoad)
{
	var resource_uri = RESTFUL_STUDENTS_API + '/students';
	var request = newJSONRequest("GET", resource_uri);

	request.onreadystatechange = function() {
		if (request.readyState == 4 && request.status == 200) 
		{
			var JSON = stringToJSON(request.responseText);
			if (typeof onStudentsLoad === 'function') 
			{
				var students = [];
				var count = parseInt(JSON.count);

				if (count == 1)
					students.push(JSON.student);
				else if (count > 1)
					students = JSON.student;

				onStudentsLoad(students);
			}
		}
	}

	request.send();
}


function deleteStudent(href, onStudentDelete)
{
	var request = newXHR();
	request.open("DELETE", href, true);

	request.onreadystatechange = function() {
		if (request.readyState == 4 && request.status == 200) 
		{
			if (typeof onStudentDelete === 'function')
				onStudentDelete();
		}
	}

	request.send();
}


function createStudent(student, onStudentCreated)
{
	var resource_uri = RESTFUL_STUDENTS_API + '/students';
	var request = newJSONRequest("POST", resource_uri);

	request.onreadystatechange = function() {
		if (request.readyState == 4 && request.status == 201) 
		{
			if (typeof onStudentCreated === 'function')
				onStudentCreated(student);
		}
	}

	var bodyData = JSONToString(student);
	request.send(bodyData);
}


/* Utils */

function newXHR()
{
	var xmlhttp;
	if (window.XMLHttpRequest) // code for IE7+, Firefox, Chrome, Opera, Safari
		xmlhttp = new XMLHttpRequest();
	else // code for IE6, IE5
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");

	return xmlhttp;
}


function newJSONRequest(method, uri)
{
	var req = newXHR();
	
	req.open(method, uri, true);

	if (method == "GET")
		req.setRequestHeader("Accept", "application/json");
	else if (method == "POST")
		req.setRequestHeader("Content-Type", "application/json");

	return req;
}


function stringToJSON(text)
{
	var obj;
	if (JSON.parse !== undefined)
		obj = JSON.parse(text);
	else
		obj = eval(text);
	return obj;
}


function JSONToString(obj)
{
	var str;
	if (JSON.stringify !== undefined)
		str = JSON.stringify(obj);
	else
		str = "";
	return str;
}