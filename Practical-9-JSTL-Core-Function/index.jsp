<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Practical 9 - JSTL Core and Function Tags</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        h1 {
            color: #667eea;
            text-align: center;
            margin-bottom: 10px;
        }
        h2 {
            color: #764ba2;
            border-bottom: 3px solid #667eea;
            padding-bottom: 10px;
            margin-top: 30px;
        }
        .section {
            background: #f8f9fa;
            padding: 20px;
            margin: 15px 0;
            border-radius: 8px;
            border-left: 4px solid #667eea;
        }
        .tag-title {
            font-weight: bold;
            color: #764ba2;
            font-size: 18px;
            margin-bottom: 10px;
        }
        .code {
            background: #2d2d2d;
            color: #f8f8f2;
            padding: 15px;
            border-radius: 5px;
            font-family: 'Courier New', monospace;
            margin: 10px 0;
            overflow-x: auto;
        }
        .output {
            background: #e8f5e9;
            padding: 12px;
            border-radius: 5px;
            border-left: 4px solid #4caf50;
            margin: 10px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }
        th {
            background: #667eea;
            color: white;
            padding: 12px;
            text-align: left;
        }
        td {
            padding: 10px;
            border: 1px solid #ddd;
        }
        tr:nth-child(even) {
            background: #f8f9fa;
        }
        .highlight {
            color: #667eea;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📚 JSTL Core & Function Tags Demo</h1>
        <p style="text-align: center; color: #666;">Practical 9: Comprehensive JSTL Demonstration</p>

        <!-- PART A: CORE TAGS -->
        <h2>Part A: Core Tags (c:out, c:set, c:remove, c:import)</h2>

        <!-- 1. c:out -->
        <div class="section">
            <div class="tag-title">1. c:out - Output Expression</div>
            <div class="code">&lt;c:out value="expression" default="defaultValue" escapeXml="true"/&gt;</div>
            
            <c:set var="username" value="John Doe" />
            <c:set var="htmlContent" value="<script>alert('test')</script>" />
            
            <div class="output">
                <strong>Example 1:</strong> Welcome, <c:out value="${username}" />!<br>
                <strong>Example 2 (with default):</strong> Age: <c:out value="${age}" default="Not specified" /><br>
                <strong>Example 3 (HTML escaping):</strong> <c:out value="${htmlContent}" escapeXml="true" />
            </div>
        </div>

        <!-- 2. c:set -->
        <div class="section">
            <div class="tag-title">2. c:set - Set Variable</div>
            <div class="code">&lt;c:set var="varName" value="varValue" scope="page|request|session|application"/&gt;</div>
            
            <c:set var="course" value="Advanced Web Programming" />
            <c:set var="semester" value="7" scope="page" />
            <c:set var="marks" value="95" />
            
            <div class="output">
                <strong>Course:</strong> <c:out value="${course}" /><br>
                <strong>Semester:</strong> <c:out value="${semester}" /><br>
                <strong>Marks:</strong> <c:out value="${marks}" /><br>
                
                <c:set var="grade" value="${marks >= 90 ? 'A+' : marks >= 80 ? 'A' : 'B'}" />
                <strong>Grade:</strong> <span class="highlight"><c:out value="${grade}" /></span>
            </div>
        </div>

        <!-- 3. c:remove -->
        <div class="section">
            <div class="tag-title">3. c:remove - Remove Variable</div>
            <div class="code">&lt;c:remove var="varName" scope="scope"/&gt;</div>
            
            <c:set var="tempVar" value="Temporary Value" />
            <div class="output">
                <strong>Before removal:</strong> <c:out value="${tempVar}" default="Variable not found" /><br>
                <c:remove var="tempVar" />
                <strong>After removal:</strong> <c:out value="${tempVar}" default="Variable not found" />
            </div>
        </div>

        <!-- 4. c:import -->
        <div class="section">
            <div class="tag-title">4. c:import - Import Content</div>
            <div class="code">&lt;c:import url="url" var="varName"/&gt;</div>
            
            <div class="output">
                <strong>Note:</strong> c:import can import content from:
                <ul>
                    <li>Relative URLs within the application</li>
                    <li>Absolute URLs from external sources</li>
                    <li>Other JSP pages or servlets</li>
                </ul>
                <strong>Example:</strong> <code>&lt;c:import url="/header.jsp"/&gt;</code>
            </div>
        </div>

        <!-- PART B: FUNCTION TAGS -->
        <h2>Part B: Function Tags (fn:toLowerCase, fn:toUpperCase, fn:substring, fn:replace)</h2>

        <c:set var="sampleText" value="Hello World From JSTL Functions!" />
        <c:set var="email" value="user@example.com" />

        <!-- 1. fn:toLowerCase -->
        <div class="section">
            <div class="tag-title">1. fn:toLowerCase - Convert to Lowercase</div>
            <div class="code">\${fn:toLowerCase(string)}</div>
            
            <div class="output">
                <strong>Original:</strong> <c:out value="${sampleText}" /><br>
                <strong>Lowercase:</strong> <span class="highlight">${fn:toLowerCase(sampleText)}</span>
            </div>
        </div>

        <!-- 2. fn:toUpperCase -->
        <div class="section">
            <div class="tag-title">2. fn:toUpperCase - Convert to Uppercase</div>
            <div class="code">\${fn:toUpperCase(string)}</div>
            
            <div class="output">
                <strong>Original:</strong> <c:out value="${sampleText}" /><br>
                <strong>Uppercase:</strong> <span class="highlight">${fn:toUpperCase(sampleText)}</span>
            </div>
        </div>

        <!-- 3. fn:substring -->
        <div class="section">
            <div class="tag-title">3. fn:substring - Extract Substring</div>
            <div class="code">\${fn:substring(string, beginIndex, endIndex)}</div>
            
            <div class="output">
                <strong>Original:</strong> <c:out value="${sampleText}" /><br>
                <strong>First 5 chars:</strong> <span class="highlight">${fn:substring(sampleText, 0, 5)}</span><br>
                <strong>From index 6-11:</strong> <span class="highlight">${fn:substring(sampleText, 6, 11)}</span><br>
                <strong>Last 10 chars:</strong> <span class="highlight">${fn:substring(sampleText, fn:length(sampleText)-10, fn:length(sampleText))}</span>
            </div>
        </div>

        <!-- 4. fn:replace -->
        <div class="section">
            <div class="tag-title">4. fn:replace - Replace String</div>
            <div class="code">\${fn:replace(string, beforeSubstring, afterSubstring)}</div>
            
            <div class="output">
                <strong>Original:</strong> <c:out value="${sampleText}" /><br>
                <strong>Replace 'World' with 'Universe':</strong> <span class="highlight">${fn:replace(sampleText, 'World', 'Universe')}</span><br>
                <strong>Replace 'JSTL' with 'Java':</strong> <span class="highlight">${fn:replace(sampleText, 'JSTL', 'Java')}</span>
            </div>
        </div>

        <!-- BONUS: More Function Examples -->
        <h2>Bonus: Additional JSTL Function Examples</h2>
        
        <div class="section">
            <table>
                <tr>
                    <th>Function</th>
                    <th>Example</th>
                    <th>Result</th>
                </tr>
                <tr>
                    <td>fn:length</td>
                    <td>\${fn:length(sampleText)}</td>
                    <td class="highlight">${fn:length(sampleText)}</td>
                </tr>
                <tr>
                    <td>fn:trim</td>
                    <td>\${fn:trim("  Hello  ")}</td>
                    <td class="highlight">${fn:trim("  Hello  ")}</td>
                </tr>
                <tr>
                    <td>fn:contains</td>
                    <td>\${fn:contains(sampleText, 'JSTL')}</td>
                    <td class="highlight">${fn:contains(sampleText, 'JSTL')}</td>
                </tr>
                <tr>
                    <td>fn:startsWith</td>
                    <td>\${fn:startsWith(sampleText, 'Hello')}</td>
                    <td class="highlight">${fn:startsWith(sampleText, 'Hello')}</td>
                </tr>
                <tr>
                    <td>fn:endsWith</td>
                    <td>\${fn:endsWith(sampleText, '!')}</td>
                    <td class="highlight">${fn:endsWith(sampleText, '!')}</td>
                </tr>
                <tr>
                    <td>fn:indexOf</td>
                    <td>\${fn:indexOf(sampleText, 'World')}</td>
                    <td class="highlight">${fn:indexOf(sampleText, 'World')}</td>
                </tr>
            </table>
        </div>

        <div style="text-align: center; margin-top: 30px; padding: 20px; background: #f0f0f0; border-radius: 8px;">
            <p><strong>✅ All JSTL Core and Function tags demonstrated successfully!</strong></p>
            <p style="color: #666;">Practical 9 Completed</p>
        </div>
    </div>
</body>
</html>
