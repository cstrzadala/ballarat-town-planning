package com.townplanning

import java.io.{BufferedWriter, File, FileWriter}

import com.lambdaworks.jacks.JacksMapper

import scala.io.Source

object BallaratTownPlanningRegisterBulkCreator {

  private val inputFile = Source.fromFile("/Users/cstrzadala/dev/github/town-planning/TownPlanningESBulk.json")

  private val outputFile = new File("/Users/cstrzadala/dev/github/town-planning/TownPlanningESBulkModified.json")

//  private val bulkLine = "POST /_bulk?refresh=true"

  def main(args: Array[String]): Unit = {
    val writer = new BufferedWriter(new FileWriter(outputFile))

//    writer.write(bulkLine)
//    writer.newLine()

    inputFile.getLines().foreach { line =>

      val jsonInputLine = JacksMapper.readValue[Map[String, Any]](line)

      val indexLine = new StringBuilder

      indexLine.append("{\"index\":{\"_index\":\"ballarat-town-planning-register\",\"_type\":\"feature\", \"_id\":\"")
      indexLine.append(jsonInputLine.get("App_Number").get)
      indexLine.append("\"}}")

      writer.write(indexLine.toString())

      writer.newLine()
      writer.write(line)
      writer.newLine()
    }

    writer.flush()
    writer.close()
  }
}
