<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="fo" version="1.1" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="resume">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <fo:layout-master-set>
        <fo:simple-page-master margin-bottom="1.5cm" margin-left="2cm" margin-right="2cm" margin-top="1.5cm" master-name="usLetter" page-height="279.4mm" page-width="215.9mm">
          <fo:region-body/>
        </fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="usLetter">
        <fo:flow flow-name="xsl-region-body">
          <fo:block font-family="Meera" font-size="36">
            <fo:leader leader-length="1mm"/>
            <xsl:value-of select="contactInfo/name"/>
          </fo:block>
          <fo:block border-top-style="solid" space-after="2mm" text-align="center"/>
          <fo:block font-size="10pt">
            <fo:table border-collapse="separate" table-layout="fixed" width="100%">
              <fo:table-column column-width="2.5cm"/>
              <fo:table-column column-width="15cm"/>
              <fo:table-body>
                <xsl:apply-templates select="summary"/>
              </fo:table-body>
            </fo:table>
            <fo:block border-top-style="solid" space-after="2mm" space-before="2mm" text-align="center"/>
            <fo:table border-collapse="separate" table-layout="fixed" width="100%">
              <fo:table-column column-width="2.5cm"/>
              <fo:table-column column-width="15cm"/>
              <fo:table-body>
                <xsl:apply-templates select="interests"/>
              </fo:table-body>
            </fo:table>
            <fo:block border-top-style="solid" space-after="2mm" space-before="2mm" text-align="center"/>
            <fo:table border-collapse="separate" table-layout="fixed" width="100%">
              <fo:table-column column-width="2.5cm"/>
              <fo:table-column column-width="15cm"/>
              <fo:table-body>
                <xsl:apply-templates select="workExperience"/>
              </fo:table-body>
            </fo:table>
            <fo:block border-top-style="solid" space-after="2mm" space-before="2mm" text-align="center"/>
            <fo:table border-collapse="separate" table-layout="fixed" width="100%">
              <fo:table-column column-width="2.5cm"/>
              <fo:table-column column-width="15cm"/>
              <fo:table-body>
                <xsl:apply-templates select="technicalSkills"/>
              </fo:table-body>
            </fo:table>
            <fo:block border-top-style="solid" space-after="2mm" space-before="2mm" text-align="center"/>
            <fo:block page-break-before="always"/>
            <fo:block border-top-style="solid" space-after="2mm" space-before="2mm" text-align="center"/>
            <fo:table border-collapse="separate" table-layout="fixed" width="100%">
              <fo:table-column column-width="2.5cm"/>
              <fo:table-column column-width="15cm"/>
              <fo:table-body>
                <xsl:apply-templates select="projects"/>
              </fo:table-body>
            </fo:table>
            <fo:block border-top-style="solid" space-after="2mm" space-before="2mm" text-align="center"/>
            <fo:table border-collapse="separate" table-layout="fixed" width="100%">
              <fo:table-column column-width="2.5cm"/>
              <fo:table-column column-width="15cm"/>
              <fo:table-body>
                <xsl:apply-templates select="education"/>
              </fo:table-body>
            </fo:table>
            <fo:block border-top-style="solid" space-after="2mm" space-before="2mm" text-align="center"/>
            <fo:table border-collapse="separate" table-layout="fixed" width="100%">
              <fo:table-column column-width="2.5cm"/>
              <fo:table-column column-width="13cm"/>
              <fo:table-column column-width="2.5cm"/>
              <fo:table-body>
                <xsl:apply-templates select="contactInfo"/>
              </fo:table-body>
            </fo:table>
            <fo:block border-top-style="solid" space-after="2mm" space-before="2mm" text-align="center"/>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
  <xsl:template match="summary">
    <fo:table-row>
      <fo:table-cell>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <fo:block>Summary:
      </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <xsl:value-of select="text()"/>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  <xsl:template match="technicalSkills">
    <fo:table-row>
      <fo:table-cell>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <fo:block>Technical Skills:</fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <fo:table border-collapse="separate" table-layout="fixed" width="100%">
            <fo:table-body>
              <xsl:for-each select="skill[position() mod 4 = 1]">
                <fo:table-row>
                  <xsl:for-each select=". | following-sibling::skill[position() &lt; 4]">
                    <fo:table-cell>
                      <fo:block font-family="Hack" font-size="9">
                        <xsl:value-of select="."/>
                      </fo:block>
                    </fo:table-cell>
                  </xsl:for-each>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  <xsl:template match="workExperience">
    <fo:table-row>
      <fo:table-cell>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <fo:block>Work Experience:
      </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block font-weight="bold">
          <xsl:value-of select="jobTitle"/>:
          <fo:basic-link color="#000040" show-destination="new" text-decoration="underline">
            <xsl:attribute name="external-destination">
              <xsl:value-of select="employerWeb"/></xsl:attribute>
            <xsl:value-of select="employer"/>
          </fo:basic-link>
        </fo:block>
        <fo:block>
          <xsl:value-of select="startDate"/> -
          <xsl:value-of select="endDate"/></fo:block>
        <fo:block font-weight="bold">Responsibilities:</fo:block>
        <fo:list-block>
          <xsl:for-each select="responsiblities/responsiblity">
            <fo:list-item>
              <fo:list-item-label end-indent="label-end()">
                <fo:block font-weight="bold" font-family="Hack">▶</fo:block>
              </fo:list-item-label>
              <fo:list-item-body start-indent="body-start()">
                <fo:block>
                  <xsl:value-of select="."/>
                </fo:block>
              </fo:list-item-body>
            </fo:list-item>
          </xsl:for-each>
        </fo:list-block>
        <fo:block font-weight="bold">Notable Achievements:</fo:block>
        <fo:list-block>
          <xsl:for-each select="accomplishments/accomplishment">
            <fo:list-item>
              <fo:list-item-label end-indent="label-end()">
                <fo:block font-weight="bold" font-family="Hack">▶</fo:block>
              </fo:list-item-label>
              <fo:list-item-body start-indent="body-start()">
                <fo:block font-style="italic">
                  <xsl:value-of select="accomplishmentId"/>
                </fo:block>
                <fo:block>
                  <xsl:value-of select="description"/>
                </fo:block>
              </fo:list-item-body>
            </fo:list-item>
          </xsl:for-each>
        </fo:list-block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  <xsl:template match="education">
    <fo:table-row>
      <fo:table-cell>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <fo:block>Education:
      </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <xsl:for-each select="degree">
          <fo:block font-weight="bold" space-before="2mm">
            <xsl:value-of select="degreeName"/>:          
            <fo:basic-link color="#000040" show-destination="new" text-decoration="underline">
              <xsl:attribute name="external-destination">
                <xsl:value-of select="universityWeb"/></xsl:attribute>
              <xsl:value-of select="universityName"/>
              <fo:leader leader-length="1mm"/>
            </fo:basic-link>(
            <xsl:value-of select="startDate"/>
            - 
            <xsl:value-of select="endDate"/>
            )</fo:block>
          <fo:list-block>
            <xsl:for-each select="arbitraryInfoList/ai">
              <fo:list-item>
                <fo:list-item-label start-indent="10">
                  <fo:block font-weight="bold">
                    <xsl:value-of select="key"/>:</fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="60">
                  <fo:block>
                    <xsl:value-of select="value"/>
                  </fo:block>
                </fo:list-item-body>
              </fo:list-item>
            </xsl:for-each>
          </fo:list-block>
        </xsl:for-each>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  <xsl:template match="projects">
    <fo:table-row>
      <fo:table-cell>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <fo:block>Personal Projects:
      </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <xsl:for-each select="project">
          <fo:block font-weight="bold" space-before="2mm">
            <xsl:value-of select="name"/>:          </fo:block>
          <fo:list-block>
            <xsl:for-each select="info">
              <fo:list-item>
                <fo:list-item-label end-indent="label-end()">
                  <fo:block font-weight="bold" font-family="Hack">▶</fo:block>
                </fo:list-item-label>
                <fo:list-item-body start-indent="body-start()">
                  <fo:block>
                    <xsl:value-of select="."/>
                  </fo:block>
                </fo:list-item-body>
              </fo:list-item>
            </xsl:for-each>
          </fo:list-block>
        </xsl:for-each>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  <xsl:template match="interests">
    <fo:table-row>
      <fo:table-cell>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <fo:block>Interests:
      </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block>
          <fo:table border-collapse="separate" table-layout="fixed" width="100%">
            <fo:table-body>
              <xsl:for-each select="interest[position() mod 4 = 1]">
                <fo:table-row>
                  <xsl:for-each select=". | following-sibling::interest[position() &lt; 4]">
                    <fo:table-cell>
                      <xsl:attribute name="font-weight">bold</xsl:attribute>
                      <fo:block>
                        <xsl:value-of select="."/>
                      </fo:block>
                    </fo:table-cell>
                  </xsl:for-each>
                </fo:table-row>
              </xsl:for-each>
            </fo:table-body>
          </fo:table>
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
  <xsl:template match="contactInfo">
    <fo:table-row>
      <fo:table-cell>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <fo:block>Contact Information:
      </fo:block>
      </fo:table-cell>
      <fo:table-cell>
        <fo:block font-weight="bold" space-after="1mm">
          <xsl:value-of select="name"/>
        </fo:block>
        <fo:list-block>
          <fo:list-item>
            <fo:list-item-label start-indent="10">
              <fo:block font-weight="bold">Phone:
                  </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="90">
              <fo:block>
                <xsl:value-of select="phone"/>
              </fo:block>
            </fo:list-item-body>
          </fo:list-item>
          <fo:list-item>
            <fo:list-item-label start-indent="10">
              <fo:block font-weight="bold">Email Address:
                  </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="90">
              <fo:block>
                <fo:basic-link color="#000040" show-destination="new" text-decoration="underline">
                  <xsl:attribute name="external-destination">mailto:<xsl:value-of select="emailAddress"/></xsl:attribute>
                  <xsl:value-of select="emailAddress"/>
                </fo:basic-link>
              </fo:block>
            </fo:list-item-body>
          </fo:list-item>
          <fo:list-item>
            <fo:list-item-label start-indent="10">
              <fo:block font-weight="bold">Web:
                  </fo:block>
            </fo:list-item-label>
            <fo:list-item-body start-indent="90">
              <fo:block>
                <fo:basic-link color="#000040" show-destination="new" text-decoration="underline">
                  <xsl:attribute name="external-destination">
                    <xsl:value-of select="webAddress"/>
                  </xsl:attribute>
                  <xsl:value-of select="webAddress"/>
                </fo:basic-link>
              </fo:block>
            </fo:list-item-body>
          </fo:list-item>
        </fo:list-block>
      </fo:table-cell>
      <fo:table-cell>
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <fo:block>
            <fo:external-graphic content-height="scale-to-fit" content-width="scale-to-fit" height="2cm" src="from_right.png" width="2cm"/>
      </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>
</xsl:stylesheet>