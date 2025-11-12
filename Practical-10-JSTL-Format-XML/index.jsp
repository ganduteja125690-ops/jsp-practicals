<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html>
<html>
<head>
    <title>Practical 10 - JSTL Format and XML Tags</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            min-height: 100vh;
        }
        .container {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
        h1 {
            color: #f5576c;
            text-align: center;
            margin-bottom: 10px;
        }
        h2 {
            color: #f093fb;
            border-bottom: 3px solid #f5576c;
            padding-bottom: 10px;
            margin-top: 30px;
        }
        .section {
            background: #f8f9fa;
            padding: 20px;
            margin: 15px 0;
            border-radius: 8px;
            border-left: 4px solid #f5576c;
        }
        .tag-title {
            font-weight: bold;
            color: #f093fb;
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
            background: #fff3cd;
            padding: 12px;
            border-radius: 5px;
            border-left: 4px solid #ff9800;
            margin: 10px 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 15px 0;
        }
        th {
            background: #f5576c;
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
            color: #f5576c;
            font-weight: bold;
        }
        .xml-box {
            background: #e1f5fe;
            padding: 15px;
            border-radius: 5px;
            border: 1px solid #03a9f4;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>📊 JSTL Format & XML Tags Demo</h1>
        <p style="text-align: center; color: #666;">Practical 10: Format and XML Tag Demonstrations</p>

        <!-- PART A: FORMAT TAGS -->
        <h2>Part A: Format Tags (fmt:formatDate, fmt:parseDate, fmt:setTimeZone)</h2>

        <jsp:useBean id="currentDate" class="java.util.Date" />

        <!-- 1. fmt:formatDate -->
        <div class="section">
            <div class="tag-title">1. fmt:formatDate - Format Date</div>
            <div class="code">&lt;fmt:formatDate value="date" pattern="pattern" type="date|time|both"/&gt;</div>
            
            <div class="output">
                <strong>Current Date Object:</strong> <c:out value="${currentDate}" /><br><br>
                
                <strong>Default Format:</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" /></span><br>
                
                <strong>Date Only:</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" type="date" /></span><br>
                
                <strong>Time Only:</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" type="time" /></span><br>
                
                <strong>Date and Time:</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" type="both" /></span><br>
                
                <strong>Custom Pattern (dd/MM/yyyy):</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" pattern="dd/MM/yyyy" /></span><br>
                
                <strong>Custom Pattern (EEEE, MMMM dd, yyyy):</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" pattern="EEEE, MMMM dd, yyyy" /></span><br>
                
                <strong>Custom Pattern (hh:mm:ss a):</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" pattern="hh:mm:ss a" /></span><br>
                
                <strong>ISO Format (yyyy-MM-dd'T'HH:mm:ss):</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" /></span>
            </div>
        </div>

        <!-- 2. fmt:parseDate -->
        <div class="section">
            <div class="tag-title">2. fmt:parseDate - Parse Date String</div>
            <div class="code">&lt;fmt:parseDate value="dateString" pattern="pattern" var="varName"/&gt;</div>
            
            <c:set var="dateString" value="12/11/2025" />
            <fmt:parseDate value="${dateString}" pattern="dd/MM/yyyy" var="parsedDate" />
            
            <div class="output">
                <strong>String to Parse:</strong> <c:out value="${dateString}" /><br>
                <strong>Parsed Date Object:</strong> <c:out value="${parsedDate}" /><br>
                <strong>Formatted Back:</strong> 
                <span class="highlight"><fmt:formatDate value="${parsedDate}" pattern="EEEE, MMMM dd, yyyy" /></span><br><br>
                
                <c:set var="timeString" value="18:30:45" />
                <fmt:parseDate value="${timeString}" pattern="HH:mm:ss" var="parsedTime" />
                <strong>Time String:</strong> <c:out value="${timeString}" /><br>
                <strong>Parsed and Formatted:</strong> 
                <span class="highlight"><fmt:formatDate value="${parsedTime}" pattern="hh:mm:ss a" /></span>
            </div>
        </div>

        <!-- 3. fmt:setTimeZone -->
        <div class="section">
            <div class="tag-title">3. fmt:setTimeZone - Set Timezone</div>
            <div class="code">&lt;fmt:setTimeZone value="timezone"/&gt;</div>
            
            <div class="output">
                <strong>Current Time (Default Timezone):</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" type="both" pattern="HH:mm:ss z" /></span><br><br>
                
                <fmt:setTimeZone value="America/New_York" />
                <strong>New York Time (America/New_York):</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" type="both" pattern="HH:mm:ss z" /></span><br>
                
                <fmt:setTimeZone value="Europe/London" />
                <strong>London Time (Europe/London):</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" type="both" pattern="HH:mm:ss z" /></span><br>
                
                <fmt:setTimeZone value="Asia/Tokyo" />
                <strong>Tokyo Time (Asia/Tokyo):</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" type="both" pattern="HH:mm:ss z" /></span><br>
                
                <fmt:setTimeZone value="Asia/Kolkata" />
                <strong>India Time (Asia/Kolkata):</strong> 
                <span class="highlight"><fmt:formatDate value="${currentDate}" type="both" pattern="HH:mm:ss z" /></span>
            </div>
        </div>

        <!-- PART B: XML TAGS -->
        <h2>Part B: XML Tags (x:parse, x:forEach, x:out)</h2>

        <!-- Create Sample XML -->
        <c:set var="xmlData">
            <students>
                <student id="1">
                    <name>Alice Johnson</name>
                    <age>20</age>
                    <grade>A</grade>
                    <major>Computer Science</major>
                </student>
                <student id="2">
                    <name>Bob Smith</name>
                    <age>21</age>
                    <grade>B+</grade>
                    <major>Information Technology</major>
                </student>
                <student id="3">
                    <name>Charlie Brown</name>
                    <age>19</age>
                    <grade>A-</grade>
                    <major>Software Engineering</major>
                </student>
            </students>
        </c:set>

        <!-- 1. x:parse -->
        <div class="section">
            <div class="tag-title">1. x:parse - Parse XML Document</div>
            <div class="code">&lt;x:parse xml="xmlString" var="varName"/&gt;</div>
            
            <x:parse xml="${xmlData}" var="doc" />
            
            <div class="xml-box">
                <strong>Sample XML Data:</strong>
                <pre>&lt;students&gt;
    &lt;student id="1"&gt;
        &lt;name&gt;Alice Johnson&lt;/name&gt;
        &lt;age&gt;20&lt;/age&gt;
        &lt;grade&gt;A&lt;/grade&gt;
        &lt;major&gt;Computer Science&lt;/major&gt;
    &lt;/student&gt;
    ...
&lt;/students&gt;</pre>
            </div>
            
            <div class="output">
                <strong>XML Document Parsed Successfully!</strong><br>
                <em>Stored in variable: doc</em>
            </div>
        </div>

        <!-- 2. x:forEach & x:out -->
        <div class="section">
            <div class="tag-title">2. x:forEach - Iterate XML & x:out - Output XML Value</div>
            <div class="code">&lt;x:forEach select="xpath" var="varName"&gt;<br>
    &lt;x:out select="xpath"/&gt;<br>
&lt;/x:forEach&gt;</div>
            
            <div class="output">
                <strong>Student Records:</strong>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Grade</th>
                        <th>Major</th>
                    </tr>
                    <x:forEach select="$doc/students/student" var="student">
                        <tr>
                            <td class="highlight"><x:out select="$student/@id" /></td>
                            <td><x:out select="$student/name" /></td>
                            <td><x:out select="$student/age" /></td>
                            <td class="highlight"><x:out select="$student/grade" /></td>
                            <td><x:out select="$student/major" /></td>
                        </tr>
                    </x:forEach>
                </table>
            </div>
        </div>

        <!-- 3. Additional x:out Examples -->
        <div class="section">
            <div class="tag-title">3. x:out - Additional XPath Examples</div>
            
            <div class="output">
                <strong>First Student Name:</strong> 
                <span class="highlight"><x:out select="$doc/students/student[1]/name" /></span><br>
                
                <strong>Second Student Age:</strong> 
                <span class="highlight"><x:out select="$doc/students/student[2]/age" /></span><br>
                
                <strong>Third Student Major:</strong> 
                <span class="highlight"><x:out select="$doc/students/student[3]/major" /></span><br>
                
                <strong>First Student ID Attribute:</strong> 
                <span class="highlight"><x:out select="$doc/students/student[1]/@id" /></span><br>
                
                <strong>Count of Students:</strong> 
                <span class="highlight"><x:out select="count($doc/students/student)" /></span>
            </div>
        </div>

        <div style="text-align: center; margin-top: 30px; padding: 20px; background: #f0f0f0; border-radius: 8px;">
            <p><strong>✅ All JSTL Format and XML tags demonstrated successfully!</strong></p>
            <p style="color: #666;">Practical 10 Completed</p>
        </div>
    </div>
</body>
</html>
