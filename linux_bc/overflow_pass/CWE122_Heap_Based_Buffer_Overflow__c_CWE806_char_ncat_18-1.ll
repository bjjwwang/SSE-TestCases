; ModuleID = 'linux_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  br label %source, !dbg !28

source:                                           ; preds = %if.end
  call void @llvm.dbg.label(metadata !29), !dbg !30
  %1 = load i8*, i8** %data, align 8, !dbg !31
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !35, metadata !DIExpression()), !dbg !40
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %4 = load i8*, i8** %data, align 8, !dbg !42
  %5 = load i8*, i8** %data, align 8, !dbg !43
  %call1 = call i64 @strlen(i8* %5) #9, !dbg !44
  %call2 = call i8* @strncat(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !45
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !46
  store i8 0, i8* %arrayidx3, align 1, !dbg !47
  %6 = load i8*, i8** %data, align 8, !dbg !48
  call void @printLine(i8* %6), !dbg !49
  %7 = load i8*, i8** %data, align 8, !dbg !50
  call void @free(i8* %7) #7, !dbg !51
  ret void, !dbg !52
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare dso_local i8* @strncat(i8*, i8*, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

declare dso_local void @printLine(i8*) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_good() #0 !dbg !53 {
entry:
  call void @goodG2B(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* null) #7, !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 %conv) #7, !dbg !67
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_good(), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_bad(), !dbg !72
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call noalias align 16 i8* @malloc(i64 100) #7, !dbg !78
  store i8* %call, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %cmp = icmp eq i8* %0, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #8, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  br label %source, !dbg !86

source:                                           ; preds = %if.end
  call void @llvm.dbg.label(metadata !87), !dbg !88
  %1 = load i8*, i8** %data, align 8, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 49, i1 false), !dbg !90
  %2 = load i8*, i8** %data, align 8, !dbg !91
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 49, !dbg !91
  store i8 0, i8* %arrayidx, align 1, !dbg !92
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !93, metadata !DIExpression()), !dbg !95
  %3 = bitcast [50 x i8]* %dest to i8*, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %3, i8 0, i64 50, i1 false), !dbg !95
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !96
  %4 = load i8*, i8** %data, align 8, !dbg !97
  %5 = load i8*, i8** %data, align 8, !dbg !98
  %call1 = call i64 @strlen(i8* %5) #9, !dbg !99
  %call2 = call i8* @strncat(i8* %arraydecay, i8* %4, i64 %call1) #7, !dbg !100
  %arrayidx3 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !101
  store i8 0, i8* %arrayidx3, align 1, !dbg !102
  %6 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* %6), !dbg !104
  %7 = load i8*, i8** %data, align 8, !dbg !105
  call void @free(i8* %7) #7, !dbg !106
  ret void, !dbg !107
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }
attributes #9 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !6, !7}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{i32 7, !"Dwarf Version", i32 4}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"clang version 13.0.0"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !4)
!19 = !DILocation(line: 25, column: 12, scope: !14)
!20 = !DILocation(line: 26, column: 20, scope: !14)
!21 = !DILocation(line: 26, column: 10, scope: !14)
!22 = !DILocation(line: 27, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!24 = !DILocation(line: 27, column: 14, scope: !23)
!25 = !DILocation(line: 27, column: 9, scope: !14)
!26 = !DILocation(line: 27, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 27, column: 23)
!28 = !DILocation(line: 28, column: 5, scope: !14)
!29 = !DILabel(scope: !14, name: "source", file: !15, line: 29)
!30 = !DILocation(line: 29, column: 1, scope: !14)
!31 = !DILocation(line: 31, column: 12, scope: !14)
!32 = !DILocation(line: 31, column: 5, scope: !14)
!33 = !DILocation(line: 32, column: 5, scope: !14)
!34 = !DILocation(line: 32, column: 17, scope: !14)
!35 = !DILocalVariable(name: "dest", scope: !36, file: !15, line: 34, type: !37)
!36 = distinct !DILexicalBlock(scope: !14, file: !15, line: 33, column: 5)
!37 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !38)
!38 = !{!39}
!39 = !DISubrange(count: 50)
!40 = !DILocation(line: 34, column: 14, scope: !36)
!41 = !DILocation(line: 36, column: 17, scope: !36)
!42 = !DILocation(line: 36, column: 23, scope: !36)
!43 = !DILocation(line: 36, column: 36, scope: !36)
!44 = !DILocation(line: 36, column: 29, scope: !36)
!45 = !DILocation(line: 36, column: 9, scope: !36)
!46 = !DILocation(line: 37, column: 9, scope: !36)
!47 = !DILocation(line: 37, column: 20, scope: !36)
!48 = !DILocation(line: 38, column: 19, scope: !36)
!49 = !DILocation(line: 38, column: 9, scope: !36)
!50 = !DILocation(line: 39, column: 14, scope: !36)
!51 = !DILocation(line: 39, column: 9, scope: !36)
!52 = !DILocation(line: 41, column: 1, scope: !14)
!53 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncat_18_good", scope: !15, file: !15, line: 68, type: !16, scopeLine: 69, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DILocation(line: 70, column: 5, scope: !53)
!55 = !DILocation(line: 71, column: 1, scope: !53)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 83, type: !57, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 83, type: !59)
!62 = !DILocation(line: 83, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 83, type: !60)
!64 = !DILocation(line: 83, column: 27, scope: !56)
!65 = !DILocation(line: 86, column: 22, scope: !56)
!66 = !DILocation(line: 86, column: 12, scope: !56)
!67 = !DILocation(line: 86, column: 5, scope: !56)
!68 = !DILocation(line: 88, column: 5, scope: !56)
!69 = !DILocation(line: 89, column: 5, scope: !56)
!70 = !DILocation(line: 90, column: 5, scope: !56)
!71 = !DILocation(line: 93, column: 5, scope: !56)
!72 = !DILocation(line: 94, column: 5, scope: !56)
!73 = !DILocation(line: 95, column: 5, scope: !56)
!74 = !DILocation(line: 97, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 48, type: !16, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 50, type: !4)
!77 = !DILocation(line: 50, column: 12, scope: !75)
!78 = !DILocation(line: 51, column: 20, scope: !75)
!79 = !DILocation(line: 51, column: 10, scope: !75)
!80 = !DILocation(line: 52, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !15, line: 52, column: 9)
!82 = !DILocation(line: 52, column: 14, scope: !81)
!83 = !DILocation(line: 52, column: 9, scope: !75)
!84 = !DILocation(line: 52, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 52, column: 23)
!86 = !DILocation(line: 53, column: 5, scope: !75)
!87 = !DILabel(scope: !75, name: "source", file: !15, line: 54)
!88 = !DILocation(line: 54, column: 1, scope: !75)
!89 = !DILocation(line: 56, column: 12, scope: !75)
!90 = !DILocation(line: 56, column: 5, scope: !75)
!91 = !DILocation(line: 57, column: 5, scope: !75)
!92 = !DILocation(line: 57, column: 16, scope: !75)
!93 = !DILocalVariable(name: "dest", scope: !94, file: !15, line: 59, type: !37)
!94 = distinct !DILexicalBlock(scope: !75, file: !15, line: 58, column: 5)
!95 = !DILocation(line: 59, column: 14, scope: !94)
!96 = !DILocation(line: 61, column: 17, scope: !94)
!97 = !DILocation(line: 61, column: 23, scope: !94)
!98 = !DILocation(line: 61, column: 36, scope: !94)
!99 = !DILocation(line: 61, column: 29, scope: !94)
!100 = !DILocation(line: 61, column: 9, scope: !94)
!101 = !DILocation(line: 62, column: 9, scope: !94)
!102 = !DILocation(line: 62, column: 20, scope: !94)
!103 = !DILocation(line: 63, column: 19, scope: !94)
!104 = !DILocation(line: 63, column: 9, scope: !94)
!105 = !DILocation(line: 64, column: 14, scope: !94)
!106 = !DILocation(line: 64, column: 9, scope: !94)
!107 = !DILocation(line: 66, column: 1, scope: !75)
