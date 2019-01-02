package pl.coderslab.model;

import java.time.LocalDate;

public class Order {

    private int id;
    private LocalDate acceptanceDate;
    private LocalDate plannedServiceStartDate;
    private LocalDate actualServiceStartDate;
    private LocalDate serviceEndDate;
    private int employeeId;
    private String problemDescription;
    private String serviceDescription;
    private String status;
    private int vehicleId;
    private double serviceCost;
    private double partsCost;
    private double employeeHourCost;
    private double workHours;

    public Order() {
    }

    public LocalDate getServiceEndDate() {
        return serviceEndDate;
    }

    public void setServiceEndDate(LocalDate serviceEndDate) {
        this.serviceEndDate = serviceEndDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDate getAcceptanceDate() {
        return acceptanceDate;
    }

    public void setAcceptanceDate(LocalDate acceptanceDate) {
        this.acceptanceDate = acceptanceDate;
    }

    public LocalDate getPlannedServiceStartDate() {
        return plannedServiceStartDate;
    }

    public void setPlannedServiceStartDate(LocalDate plannedServiceStartDate) {
        this.plannedServiceStartDate = plannedServiceStartDate;
    }

    public LocalDate getActualServiceStartDate() {
        return actualServiceStartDate;
    }

    public void setActualServiceStartDate(LocalDate actualServiceStartDate) {
        this.actualServiceStartDate = actualServiceStartDate;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getProblemDescription() {
        return problemDescription;
    }

    public void setProblemDescription(String problemDescription) {
        this.problemDescription = problemDescription;
    }

    public String getServiceDescription() {
        return serviceDescription;
    }

    public void setServiceDescription(String serviceDescription) {
        this.serviceDescription = serviceDescription;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(int vehicleId) {
        this.vehicleId = vehicleId;
    }

    public double getServiceCost() {
        return serviceCost;
    }

    public void setServiceCost(double serviceCost) {
        this.serviceCost = serviceCost;
    }

    public double getPartsCost() {
        return partsCost;
    }

    public void setPartsCost(double partsCost) {
        this.partsCost = partsCost;
    }

    public double getEmployeeHourCost() {
        return employeeHourCost;
    }

    public void setEmployeeHourCost(double employeeHourCost) {
        this.employeeHourCost = employeeHourCost;
    }

    public double getWorkHours() {
        return workHours;
    }

    public void setWorkHours(double workHours) {
        this.workHours = workHours;
    }
}
