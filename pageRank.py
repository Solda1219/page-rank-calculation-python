import json
import time
import math
import mysql.connector

#this is algorithm to calculate PageRank from https://www.geeksforgeeks.org/page-rank-algorithm-implementation/

# You can easily understand from this.
# Suppose instead that page B had a link to pages C and A, page C had a link to page A, 
# and page D had links to all three pages. 
# Thus, upon the first iteration, page B would transfer half of its existing value, 
# or 0.125, to page A and the other half, 
# or 0.125, to page C. Page C would transfer all of its existing value, 0.25, to the only page it links to, A. 
# Since D had three outbound links, it would transfer one third of its existing value, or approximately 0.083, to A. 
# At the completion of this iteration, page A will have a PageRank of approximately 0.458.


# this is DB connect part

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="pagerank"
)

mycursor = mydb.cursor()

# this is total rank and you can set this from 0.00...1 to 100.... what ever ok.
totalRank= 1

class PageRank():
    
    # this is to get row counts of table
    def getCountFromUrls(self, table):
        mycursor = mydb.cursor()
        sql= "SELECT COUNT(*) FROM " + str(table)
        mycursor.execute(sql)
        urlCount= mycursor.fetchone()[0]
        mycursor.close()
        return urlCount

    # this is make urls to same type from urls table
    # ie. "http/asdfsdf/asdfasdf" and "http/asdfsdf/asdfasdf/" is not same in db.
    # so first make it same type.
    def updateUrlsFromUrls(self):
        print('now doing url update from urls! this could be take minutes if DB is huge. Please wait..\n')
        urlCount= self.getCountFromUrls('urls')
        mycursor = mydb.cursor()
        for id in range(urlCount+1):
            if id== 0:
                continue
            sql= "SELECT url FROM urls WHERE id ="+ str(id)
            mycursor.execute(sql)
            urls= mycursor.fetchall()
            url= " "
            if len(urls)> 0:
                url1= urls[0]
                url= url1[0].decode("utf-8")
            if url[-1]=="/":
                url= url[:-1]
            sql= "UPDATE urls SET url= %s WHERE id= %s"
            val= (str(url), str(id))
            mycursor.execute(sql, val)
            mydb.commit()
        mycursor.close()

    # def makeSameType(self, url):
    #     if url[-1]== "/":
    #         url= url[:-1]
    #         return url
    #     return url
    

    # this is make urls to same type from links table
    # ie. "http/asdfsdf/asdfasdf" and "http/asdfsdf/asdfasdf/" is not same in db.
    # so first make it same type.

    def updateUrlsFromLinks(self):
        print('now doing url update from links! this could be take minutes if DB is huge. Please wait...\n')
        urlCount= self.getCountFromUrls('links')
        mycursor = mydb.cursor()
        for id in range(urlCount+1): #39637
            if id== 0:
                continue
            sql= "SELECT * FROM links WHERE id ="+ str(id)
            mycursor.execute(sql)
            links= mycursor.fetchall()
            if len(links)> 0:
                link= links[0]
                source1= link[1]
                source= source1.decode("utf-8")
                target1= link[2]
                target= target1.decode("utf-8")
            if source[-1]=="/":
                source= source[:-1]
            if target[-1]=="/":
                target= target[:-1]
            sql= "UPDATE links SET source= %s, target= %s WHERE id= %s"
            val= (str(source), str(target), str(id))
            mycursor.execute(sql, val)
            mydb.commit()
        mycursor.close()

    # this is to get url from urls
    def getUrlFromUrls(self, id):
        mycursor = mydb.cursor()
        sql= "SELECT url FROM urls WHERE id=" + str(id)
        mycursor.execute(sql)
        url1= mycursor.fetchall()[0]
        url= url1[0].decode("utf-8")
        mycursor.close()
        return url

    # this is to get outlinks of url from links
    def getOutCountsFromLinks(self, url):
        mycursor = mydb.cursor()
        sql= "SELECT COUNT(*) FROM links WHERE source= %s"
        val= (str(url),)
        mycursor.execute(sql, val)
        outCounts= mycursor.fetchone()[0]
        mycursor.close()
        return outCounts

    # this is to get incomes urls of url from links
    def getIncomesFromLinks(self, url):
        time.sleep(0.05)
        mycursor = mydb.cursor()
        sql= "SELECT DISTINCT source FROM links WHERE target= %s"
        val= (str(url),)
        mycursor.execute(sql, val)

        incomes= mycursor.fetchall()
        time.sleep(0.05)
        mycursor.close()
        return incomes

    # def makeOjData(self, url, outCounts, incomes):
    #     return {url: url, outCounts: outCounts, incomes: incomes}


    # this is to insert pagerank into pageranks table
    def insertIntoPageRank(self, url, pagerank):
        mycursor = mydb.cursor()
        sql = "INSERT INTO pageranks (url, pagerank) VALUES (%s, %s)"
        val = (url, pagerank)
        mycursor.execute(sql, val)
        mydb.commit()
        mycursor.close()

    def tableExist(self, tablename):
        mycursor = mydb.cursor()
        _SQL = """SHOW TABLES"""
        mycursor.execute(_SQL)
        results = mycursor.fetchall()

        print('All existing tables:', results) # Returned as a list of tuples

        results_list = [item[0] for item in results] # Conversion to list of str

        if tablename in results_list:
            return "exist"
        else:
            return "notExist"
            
    def createPRtable(self):
        mycursor = mydb.cursor()
        sql= "CREATE TABLE pageranks (id INT AUTO_INCREMENT PRIMARY KEY, url VARCHAR(500), pagerank VARCHAR(500))"
        mycursor.execute(sql)
        mycursor.close()
        
if __name__ == '__main__':
    
    pageRk = PageRank()
    # pageRk.createPRtable()
    print(pageRk.tableExist('pageranks'))
    # this is to make urls same style
    # pageRk.updateUrlsFromUrls()
    # pageRk.updateUrlsFromLinks()

    # this is the varable to store urls in this type {url: url, outCounts: outCounts, incomes: incomes}
    # allUFData= {}

    # # get url counts from urls table.
    # urlCount= pageRk.getCountFromUrls('urls')

    # # default PageRank of each url
    # defaultPR= totalRank/urlCount

    # print(defaultPR)

    # # get all usefull data of each url in this type {url: url, outCounts: outCounts, incomes: incomes}.
    # for i in range(urlCount+1):
    #     if i== 0:
    #         continue
    #     # get url from urls table.
    #     url= pageRk.getUrlFromUrls(i)

    #     # get outCounts of url
    #     outCounts= pageRk.getOutCountsFromLinks(url)

    #     # get incomes of this url from others
    #     incomes= pageRk.getIncomesFromLinks(url)
    #     allUFData[url]= {'url': url, 'outCounts': outCounts, 'incomes': incomes}

    #     print(str(i)+ " inserted in allUFData successfully!")

    # # get PageRank of each page and set it pagerank DB.
    # for ufData in allUFData:

    #     # if there are no in comes then it's pagerank will be 0.
    #     pagerank= 0
    #     for income in allUFData[ufData]['incomes']:
    #         incomeUrl= income[0].decode("utf-8")
    #         pagerank+= defaultPR/allUFData[incomeUrl]['outCounts']
    #     urlOfPR= allUFData[ufData]['url']
    #     pageRk.insertIntoPageRank(urlOfPR, pagerank)
    #     print(ufData+ " inserted in DB!")
        # print(allUFData[ufData])
        # print(allUFData[ufData]['incomes'][0][0].decode("utf-8")+"\n")