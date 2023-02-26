; ModuleID = 'linux_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  %cmp = icmp eq i8* %0, null, !dbg !24
  br i1 %cmp, label %if.then, label %if.end, !dbg !25

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !26
  unreachable, !dbg !26

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %call1 = call i8* @badSource(i8* %1), !dbg !29
  store i8* %call1, i8** %data, align 8, !dbg !30
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !31, metadata !DIExpression()), !dbg !36
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !36
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !37
  %3 = load i8*, i8** %data, align 8, !dbg !38
  %4 = load i8*, i8** %data, align 8, !dbg !39
  %call2 = call i64 @strlen(i8* %4) #10, !dbg !40
  %mul = mul i64 %call2, 1, !dbg !41
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %3, i64 %mul, i1 false), !dbg !37
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !42
  store i8 0, i8* %arrayidx, align 1, !dbg !43
  %5 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* %5), !dbg !45
  %6 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* %6) #8, !dbg !47
  ret void, !dbg !48
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @badSource(i8* %data) #0 !dbg !49 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !52, metadata !DIExpression()), !dbg !53
  %0 = load i8*, i8** %data.addr, align 8, !dbg !54
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !55
  %1 = load i8*, i8** %data.addr, align 8, !dbg !56
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !56
  store i8 0, i8* %arrayidx, align 1, !dbg !57
  %2 = load i8*, i8** %data.addr, align 8, !dbg !58
  ret i8* %2, !dbg !59
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #5

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #6

declare dso_local void @printLine(i8*) #7

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_good() #0 !dbg !60 {
entry:
  call void @goodG2B(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #8, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #8, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @goodG2B() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call noalias align 16 i8* @malloc(i64 100) #8, !dbg !85
  store i8* %call, i8** %data, align 8, !dbg !86
  %0 = load i8*, i8** %data, align 8, !dbg !87
  %cmp = icmp eq i8* %0, null, !dbg !89
  br i1 %cmp, label %if.then, label %if.end, !dbg !90

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #9, !dbg !91
  unreachable, !dbg !91

if.end:                                           ; preds = %entry
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %call1 = call i8* @goodG2BSource(i8* %1), !dbg !94
  store i8* %call1, i8** %data, align 8, !dbg !95
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !96, metadata !DIExpression()), !dbg !98
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !98
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !99
  %3 = load i8*, i8** %data, align 8, !dbg !100
  %4 = load i8*, i8** %data, align 8, !dbg !101
  %call2 = call i64 @strlen(i8* %4) #10, !dbg !102
  %mul = mul i64 %call2, 1, !dbg !103
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 16 %arraydecay, i8* align 1 %3, i64 %mul, i1 false), !dbg !99
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !105
  %5 = load i8*, i8** %data, align 8, !dbg !106
  call void @printLine(i8* %5), !dbg !107
  %6 = load i8*, i8** %data, align 8, !dbg !108
  call void @free(i8* %6) #8, !dbg !109
  ret void, !dbg !110
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i8* @goodG2BSource(i8* %data) #0 !dbg !111 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %0 = load i8*, i8** %data.addr, align 8, !dbg !114
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !115
  %1 = load i8*, i8** %data.addr, align 8, !dbg !116
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !116
  store i8 0, i8* %arrayidx, align 1, !dbg !117
  %2 = load i8*, i8** %data.addr, align 8, !dbg !118
  ret i8* %2, !dbg !119
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { argmemonly nofree nounwind willreturn }
attributes #7 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nounwind }
attributes #9 = { noreturn nounwind }
attributes #10 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42-1.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_bad", scope: !15, file: !15, line: 31, type: !16, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 33, type: !4)
!19 = !DILocation(line: 33, column: 12, scope: !14)
!20 = !DILocation(line: 34, column: 20, scope: !14)
!21 = !DILocation(line: 34, column: 10, scope: !14)
!22 = !DILocation(line: 35, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !14, file: !15, line: 35, column: 9)
!24 = !DILocation(line: 35, column: 14, scope: !23)
!25 = !DILocation(line: 35, column: 9, scope: !14)
!26 = !DILocation(line: 35, column: 24, scope: !27)
!27 = distinct !DILexicalBlock(scope: !23, file: !15, line: 35, column: 23)
!28 = !DILocation(line: 36, column: 22, scope: !14)
!29 = !DILocation(line: 36, column: 12, scope: !14)
!30 = !DILocation(line: 36, column: 10, scope: !14)
!31 = !DILocalVariable(name: "dest", scope: !32, file: !15, line: 38, type: !33)
!32 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!33 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 400, elements: !34)
!34 = !{!35}
!35 = !DISubrange(count: 50)
!36 = !DILocation(line: 38, column: 14, scope: !32)
!37 = !DILocation(line: 40, column: 9, scope: !32)
!38 = !DILocation(line: 40, column: 23, scope: !32)
!39 = !DILocation(line: 40, column: 36, scope: !32)
!40 = !DILocation(line: 40, column: 29, scope: !32)
!41 = !DILocation(line: 40, column: 41, scope: !32)
!42 = !DILocation(line: 41, column: 9, scope: !32)
!43 = !DILocation(line: 41, column: 20, scope: !32)
!44 = !DILocation(line: 42, column: 19, scope: !32)
!45 = !DILocation(line: 42, column: 9, scope: !32)
!46 = !DILocation(line: 43, column: 14, scope: !32)
!47 = !DILocation(line: 43, column: 9, scope: !32)
!48 = !DILocation(line: 45, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "badSource", scope: !15, file: !15, line: 23, type: !50, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!50 = !DISubroutineType(types: !51)
!51 = !{!4, !4}
!52 = !DILocalVariable(name: "data", arg: 1, scope: !49, file: !15, line: 23, type: !4)
!53 = !DILocation(line: 23, column: 32, scope: !49)
!54 = !DILocation(line: 26, column: 12, scope: !49)
!55 = !DILocation(line: 26, column: 5, scope: !49)
!56 = !DILocation(line: 27, column: 5, scope: !49)
!57 = !DILocation(line: 27, column: 17, scope: !49)
!58 = !DILocation(line: 28, column: 12, scope: !49)
!59 = !DILocation(line: 28, column: 5, scope: !49)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_42_good", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 78, column: 5, scope: !60)
!62 = !DILocation(line: 79, column: 1, scope: !60)
!63 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 91, type: !64, scopeLine: 92, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !15, line: 91, type: !66)
!69 = !DILocation(line: 91, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !15, line: 91, type: !67)
!71 = !DILocation(line: 91, column: 27, scope: !63)
!72 = !DILocation(line: 94, column: 22, scope: !63)
!73 = !DILocation(line: 94, column: 12, scope: !63)
!74 = !DILocation(line: 94, column: 5, scope: !63)
!75 = !DILocation(line: 96, column: 5, scope: !63)
!76 = !DILocation(line: 97, column: 5, scope: !63)
!77 = !DILocation(line: 98, column: 5, scope: !63)
!78 = !DILocation(line: 101, column: 5, scope: !63)
!79 = !DILocation(line: 102, column: 5, scope: !63)
!80 = !DILocation(line: 103, column: 5, scope: !63)
!81 = !DILocation(line: 105, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 60, type: !16, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !15, line: 62, type: !4)
!84 = !DILocation(line: 62, column: 12, scope: !82)
!85 = !DILocation(line: 63, column: 20, scope: !82)
!86 = !DILocation(line: 63, column: 10, scope: !82)
!87 = !DILocation(line: 64, column: 9, scope: !88)
!88 = distinct !DILexicalBlock(scope: !82, file: !15, line: 64, column: 9)
!89 = !DILocation(line: 64, column: 14, scope: !88)
!90 = !DILocation(line: 64, column: 9, scope: !82)
!91 = !DILocation(line: 64, column: 24, scope: !92)
!92 = distinct !DILexicalBlock(scope: !88, file: !15, line: 64, column: 23)
!93 = !DILocation(line: 65, column: 26, scope: !82)
!94 = !DILocation(line: 65, column: 12, scope: !82)
!95 = !DILocation(line: 65, column: 10, scope: !82)
!96 = !DILocalVariable(name: "dest", scope: !97, file: !15, line: 67, type: !33)
!97 = distinct !DILexicalBlock(scope: !82, file: !15, line: 66, column: 5)
!98 = !DILocation(line: 67, column: 14, scope: !97)
!99 = !DILocation(line: 69, column: 9, scope: !97)
!100 = !DILocation(line: 69, column: 23, scope: !97)
!101 = !DILocation(line: 69, column: 36, scope: !97)
!102 = !DILocation(line: 69, column: 29, scope: !97)
!103 = !DILocation(line: 69, column: 41, scope: !97)
!104 = !DILocation(line: 70, column: 9, scope: !97)
!105 = !DILocation(line: 70, column: 20, scope: !97)
!106 = !DILocation(line: 71, column: 19, scope: !97)
!107 = !DILocation(line: 71, column: 9, scope: !97)
!108 = !DILocation(line: 72, column: 14, scope: !97)
!109 = !DILocation(line: 72, column: 9, scope: !97)
!110 = !DILocation(line: 74, column: 1, scope: !82)
!111 = distinct !DISubprogram(name: "goodG2BSource", scope: !15, file: !15, line: 51, type: !50, scopeLine: 52, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!112 = !DILocalVariable(name: "data", arg: 1, scope: !111, file: !15, line: 51, type: !4)
!113 = !DILocation(line: 51, column: 36, scope: !111)
!114 = !DILocation(line: 54, column: 12, scope: !111)
!115 = !DILocation(line: 54, column: 5, scope: !111)
!116 = !DILocation(line: 55, column: 5, scope: !111)
!117 = !DILocation(line: 55, column: 16, scope: !111)
!118 = !DILocation(line: 56, column: 12, scope: !111)
!119 = !DILocation(line: 56, column: 5, scope: !111)
