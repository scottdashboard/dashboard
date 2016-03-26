
# http://code.tutsplus.com/series/creating-a-web-app-from-scratch-using-python-flask-and-mysql--cms-827
# https://github.com/jay3dec/PythonFlaskMySQLApp---Part-1
# http://code.tutsplus.com/tutorials/creating-a-web-app-from-scratch-using-python-flask-and-mysql-part-2--cms-22999

# Templating Jinja:
# https://pythonspot.com/flask-and-great-looking-charts-using-chart-js/
# http://code.runnable.com/UpY_2DUSfzZeAAAb/using-loops-in-templates-for-python-flask-and-jinja2
# http://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-ii-templates

# Refresh Charts - Automaticall and via button
# http://code.runnable.com/UiPhLHanceFYAAAP/how-to-perform-ajax-in-flask-for-python

# Refresh Charts - With Socket.io
# http://www.shanelynn.ie/asynchronous-updates-to-a-webpage-with-flask-and-socket-io/


import os,sys,re, csv
import json
from flask import Flask, render_template, json, request, redirect
from flask import session
#from flask.ext.mysql import MySQL


app = Flask(__name__)
app.secret_key = 'naistaraz'

############################################################
#
#   Home Page
#
############################################################
@app.route("/")
def main():
    #return render_template('index.html')
    return render_template('page-login.html')


############################################################
#
#   Sign In
#
############################################################
@app.route('/login')
def login():
    return render_template('page-login.html')


############################################################
#
#   Sign In - Validate User
#
############################################################
@app.route('/validateLogin',methods=['POST'])
def validateLogin():
    try:
        _username = request.form['inputEmail']
        _password = request.form['inputPassword']
        
        if (len(_username)>0) and (len(_password)>0) and re.search('[a-z]+',_password):
            if _password == 'secret':
                session['user'] = _username
                return redirect('/dashboard')
            else:
                return render_template('error.html',error = 'Wrong Email address or Password.')
        else:
            return render_template('error.html',error = 'Wrong Email address or Password.')
    except Exception as e:
        return render_template('error.html',error = str(e))



############################################################
#
#   User Homepage
#
############################################################
@app.route('/dashboard')
def dashboard():
    if session.get('user'):
        labels = ["Male","Female","Unknown"]
        values = [55,40,5]
        return render_template('dashboard.html', set=zip(labels,values))
    else:
        return render_template('error.html',error = 'Unauthorized Access')


############################################################
#
#   Session Logout
#
############################################################
@app.route('/logout')
def logout():
    session.pop('user',None)
    return redirect('/')







#@app.route('/feed/word_count', methods=['GET'])
#def get_word_count():
#    myout = json.load(open('/Users/zarats/flask/templates/flare.json','rb'))
#    return myout


############################################################
#
#   End - Run App
#
############################################################
if __name__ == "__main__":
    #app.run()
    app.run(threaded=True, host='0.0.0.0')

#ZEND





