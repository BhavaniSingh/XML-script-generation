<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="/"> 
        <Message DatatypesVersion="WG110072201702" TransportVersion="WG110072201702" TransactionDomain="SCRIPT" TransactionVersion="WG110072201702" StructuresVersion="WG110072201702" 
            ECLVersion="WG110072201702" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">      
            <Header>
                <To Qualifier="P">1013988328</To>
                <From Qualifier="D"><xsl:value-of select="/ClinicalDocument/author[1]/assignedAuthor[1]/code[1]/@code"/></From>
                <MessageID>600000</MessageID>
                <SentTime><xsl:value-of select="'2018-01-01T10:00:23'"/></SentTime>
                <SenderSoftware>
                    <SenderSoftwareDeveloper><xsl:value-of select="'NIST Conformace Tool'"/></SenderSoftwareDeveloper>
                    <SenderSoftwareProduct><xsl:value-of select="443"/></SenderSoftwareProduct>
                    <SenderSoftwareVersionRelease><xsl:value-of select="12.1"/></SenderSoftwareVersionRelease>
                </SenderSoftware>
                
                
                <PrescriberOrderNumber><xsl:value-of select="'ORDMU201'"/></PrescriberOrderNumber>
            </Header>
            <Body>
                <NewRx>
                    
                    <Patient>
                        <HumanPatient>
                            <xsl:for-each select="/ClinicalDocument/recordTarget[1]/patientRole[1]/patient[1]/name[1]">
                                <Name>
                                    <LastName><xsl:value-of select="family"/></LastName>
                                    <FirstName><xsl:value-of select="given"/></FirstName>
                                    
                                </Name>
                                
                            </xsl:for-each> 
                            <Gender><xsl:value-of select="/ClinicalDocument/recordTarget[1]/patientRole[1]/patient[1]/administrativeGenderCode[1]/@code"/></Gender>
                            <DateOfBirth>
                                <xsl:variable name="test" select="/ClinicalDocument/recordTarget[1]/patientRole[1]/patient[1]/birthTime[1]/@value"/> 
                                <Date><xsl:value-of select="concat(substring($test,1,4),'-',substring($test,5,2),'-',substring($test,7,2))"/></Date>
                            </DateOfBirth>
                            <xsl:for-each select="/ClinicalDocument/recordTarget[1]/patientRole[1]/addr[1]">
                                <Address>
                                    
                                    <AddressLine1><xsl:value-of select="streetAddressLine"/></AddressLine1>
                                    <City><xsl:value-of select="city"/></City>
                                    <StateProvince><xsl:value-of select="state"/></StateProvince>
                                    <PostalCode><xsl:value-of select="postalCode"/></PostalCode>
                                    <CountryCode><xsl:value-of select="country"/></CountryCode>
                                </Address> 
                            </xsl:for-each>
                            <CommunicationNumbers>
                                <PrimaryTelephone>
                                    <xsl:variable name="phone" select="/ClinicalDocument/recordTarget[1]/patientRole[1]/telecom[1]/@value"/> 
                                    <Number><xsl:value-of select="concat(substring($phone,8,3),substring($phone,12,3),substring($phone,16,4))"/></Number>
                                    
                                </PrimaryTelephone>
                            </CommunicationNumbers>
                        </HumanPatient>
                    </Patient>
                    <Pharmacy>
                        <Identification>      
                            <NCPDPID><xsl:value-of select="1120188"/></NCPDPID>
                            <NPI><xsl:value-of select="1013988328"/></NPI>
                        </Identification>
                        <BusinessName><xsl:value-of select="'NYC Pharmacy 10.6MU'"/></BusinessName>
                        <Address>
                            <AddressLine1><xsl:value-of select="'88 Park Street'"/></AddressLine1>
                            <City><xsl:value-of select="'88 Park Street'"/>Brooklyn</City>
                            <StateProvince><xsl:value-of select="'VA'"/></StateProvince>
                            <PostalCode><xsl:value-of select="'22150'"/></PostalCode>
                            <CountryCode><xsl:value-of select="'US'"/></CountryCode>
                        </Address>
                        <CommunicationNumbers>
                            <PrimaryTelephone>
                                <Number>5177809233</Number>
                            </PrimaryTelephone>
                        </CommunicationNumbers>
                    </Pharmacy>
                    
                    
                    <Prescriber>
                        <NonVeterinarian>
                            <Identification>
                                <NPI><xsl:value-of select="/ClinicalDocument/author[1]/assignedAuthor[1]/code[1]/@code"/></NPI>
                            </Identification>
                            <PracticeLocation><BusinessName><xsl:value-of select="/ClinicalDocument/componentOf[1]/encompassingEncounter[1]/location[1]/healthCareFacility[1]/location[1]/name[1]"/></BusinessName></PracticeLocation>           
                            <xsl:for-each select="/ClinicalDocument/author[1]/assignedAuthor[1]/assignedPerson[1]/name[1]">
                                <Name>
                                    <LastName><xsl:value-of select="family"/></LastName>
                                    <FirstName><xsl:value-of select="given"/></FirstName>
                                    
                                    
                                </Name>
                                
                            </xsl:for-each>
                            
                            
                            <xsl:for-each select="/ClinicalDocument/componentOf[1]/encompassingEncounter[1]/location[1]/healthCareFacility[1]/location[1]/addr[1]">
                                <Address>                  
                                    <AddressLine1><xsl:value-of select="streetAddressLine"/></AddressLine1>
                                    <City><xsl:value-of select="city"/></City>
                                    <StateProvince><xsl:value-of select="state"/></StateProvince>
                                    <PostalCode><xsl:value-of select="postalCode"/></PostalCode>
                                    <CountryCode><xsl:value-of select="country"/></CountryCode>
                                </Address>
                            </xsl:for-each>
                            <CommunicationNumbers>
                                <PrimaryTelephone>
                                    <xsl:variable name="phone1" select="/ClinicalDocument/author[1]/assignedAuthor[1]/telecom[1]/@value"/> 
                                    <Number><xsl:value-of select="concat(substring($phone1,8,3),substring($phone1,12,3),substring($phone1,16,4))"/></Number>
                                </PrimaryTelephone>
                            </CommunicationNumbers>
                        </NonVeterinarian>
                    </Prescriber>
                    
                    <MedicationPrescribed>
                        <DrugDescription><xsl:value-of select="/ClinicalDocument/component[1]/structuredBody[1]/component[8]/section[1]/entry[2]/substanceAdministration[1]/consumable[1]/manufacturedProduct[1]/manufacturedMaterial[1]/code[1]/@displayName"/></DrugDescription>
                        <DrugCoded>
                            <ProductCode>
                                <Code><xsl:value-of select="'12634043693'"/></Code>
                                <Qualifier>ND</Qualifier>
                            </ProductCode>
                            <Strength>
                                <StrengthValue><xsl:value-of select="50"/></StrengthValue>
                                <StrengthForm>
                                    <Code><xsl:value-of select="/ClinicalDocument/component[1]/structuredBody[1]/component[8]/section[1]/entry[1]/substanceAdministration[1]/administrationUnitCode[1]/@code"/></Code>
                                </StrengthForm>
                                <StrengthUnitOfMeasure>
                                    <Code><xsl:value-of select="'C28253'"/></Code>
                                </StrengthUnitOfMeasure>
                            </Strength>
                            <DrugDBCode>
                                <Code><xsl:value-of select="/ClinicalDocument/component[1]/structuredBody[1]/component[8]/section[1]/entry[2]/substanceAdministration[1]/consumable[1]/manufacturedProduct[1]/manufacturedMaterial[1]/code[1]/@code"/></Code>
                                <Qualifier>SCD</Qualifier>
                            </DrugDBCode>
                        </DrugCoded>
                        <Quantity>
                            <Value><xsl:value-of select="152"/></Value>
                            <CodeListQualifier><xsl:value-of select="38"/></CodeListQualifier>
                            <QuantityUnitOfMeasure>
                                <Code><xsl:value-of select="/ClinicalDocument/component[1]/structuredBody[1]/component[8]/section[1]/entry[2]/substanceAdministration[1]/administrationUnitCode[1]/@code"/></Code>
                            </QuantityUnitOfMeasure>
                        </Quantity>
                        <DaysSupply><xsl:value-of select="152"/></DaysSupply>
                        <WrittenDate>
                            <xsl:variable name="written" select="/ClinicalDocument/component[1]/structuredBody[1]/component[8]/section[1]/entry[1]/substanceAdministration[1]/effectiveTime[1]/low[1]/@value"/> 
                            <Date><xsl:value-of select="concat(substring($written,1,4),'-',substring($written,5,2),'-',substring($written,7,2))"/></Date>
                        </WrittenDate>
                        <Substitutions>0</Substitutions>
                        <NumberOfRefills>0</NumberOfRefills>
                        <Diagnosis>
                            <ClinicalInformationQualifier>1</ClinicalInformationQualifier>
                            <Primary>
                                <Code><xsl:value-of select="'I10'"/></Code>
                                <Qualifier><xsl:value-of select="'ABF'"/></Qualifier>
                                <Description><xsl:value-of select="/ClinicalDocument/component[1]/structuredBody[1]/component[10]/section[1]/entry[1]/act[1]/entryRelationship[1]/observation[1]/value[1]/@displayName"/></Description>
                            </Primary>
                        </Diagnosis>
                        <Sig>
                            <SigText><xsl:value-of select="/ClinicalDocument/component[1]/structuredBody[1]/component[8]/section[1]/text[1]/list[1]/item[2]"/></SigText>
                            <CodeSystem>
                                <SNOMEDVersion><xsl:value-of select="20160901"/></SNOMEDVersion>
                                <FMTVersion><xsl:value-of select="'16.03d'"/></FMTVersion>
                            </CodeSystem>
                            <Instruction>
                                <DoseAdministration>
                                    <DoseDeliveryMethod>
                                        <Text>Take</Text>
                                        <Qualifier>SNOMED</Qualifier>
                                        <Code>419652001</Code>
                                    </DoseDeliveryMethod>
                                    <Dosage>
                                        <DoseQuantity>1</DoseQuantity>
                                        <DoseUnitOfMeasure>
                                            <Text><xsl:value-of select="/ClinicalDocument/component[1]/structuredBody[1]/component[8]/section[1]/entry[2]/substanceAdministration[1]/administrationUnitCode[1]/@displayName"/></Text>
                                            <Qualifier><xsl:value-of select="'DoseUnitOfMeasure'"/></Qualifier>
                                            <Code><xsl:value-of select="'C48542'"/></Code> 
                                        </DoseUnitOfMeasure>
                                    </Dosage>
                                    <RouteOfAdministration>
                                        <Text><xsl:value-of select="/ClinicalDocument/component[1]/structuredBody[1]/component[8]/section[1]/entry[2]/substanceAdministration[1]/routeCode[1]/@displayName"/></Text>
                                        <Qualifier><xsl:value-of select="'SNOMED'"/></Qualifier>
                                        <Code><xsl:value-of select="26643006"/></Code>
                                    </RouteOfAdministration>
                                </DoseAdministration>
                                <TimingAndDuration>
                                    <AdministrationTiming>
                                        <AdministrationTimingEvent>
                                            <Text><xsl:value-of select="'before bedtime'"/></Text>
                                            <Qualifier><xsl:value-of select="'SNOMED'"/></Qualifier>
                                            <Code><xsl:value-of select="307155000"/></Code>
                                        </AdministrationTimingEvent>
                                    </AdministrationTiming>
                                </TimingAndDuration>
                                <TimingAndDuration>
                                    <Frequency>
                                        <FrequencyNumericValue>1</FrequencyNumericValue>
                                        <FrequencyUnits>
                                            <Text><xsl:value-of select="'day'"/></Text>
                                            <Qualifier><xsl:value-of select="'SNOMED'"/></Qualifier>
                                            <Code><xsl:value-of select="258703001"/></Code>
                                        </FrequencyUnits>
                                    </Frequency>
                                </TimingAndDuration>
                            </Instruction>
                            
                        </Sig>       
                    </MedicationPrescribed>
                </NewRx>
            </Body>
        </Message>
    </xsl:template>
</xsl:stylesheet>