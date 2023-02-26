; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@GLOBAL_CONST_FIVE = external constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !21
  store i8* %call, i8** %data, align 8, !dbg !22
  %0 = load i8*, i8** %data, align 8, !dbg !23
  %cmp = icmp eq i8* %0, null, !dbg !25
  br i1 %cmp, label %if.then, label %if.end, !dbg !26

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !27
  unreachable, !dbg !27

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !29
  %cmp1 = icmp eq i32 %1, 5, !dbg !31
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !32

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !33
  %3 = load i8*, i8** %data, align 8, !dbg !33
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !33
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 99, i64 noundef %4) #9, !dbg !33
  %5 = load i8*, i8** %data, align 8, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 99, !dbg !35
  store i8 0, i8* %arrayidx, align 1, !dbg !36
  br label %if.end4, !dbg !37

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !44
  %7 = load i8*, i8** %data, align 8, !dbg !44
  %8 = load i8*, i8** %data, align 8, !dbg !44
  %call5 = call i64 @strlen(i8* noundef %8), !dbg !44
  %call6 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %call5, i64 noundef 50) #9, !dbg !44
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !45
  store i8 0, i8* %arrayidx7, align 1, !dbg !46
  %9 = load i8*, i8** %data, align 8, !dbg !47
  call void @printLine(i8* noundef %9), !dbg !48
  %10 = load i8*, i8** %data, align 8, !dbg !49
  call void @free(i8* noundef %10), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #4

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #5

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #4

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13_good() #0 !dbg !52 {
entry:
  call void @goodG2B1(), !dbg !53
  call void @goodG2B2(), !dbg !54
  ret void, !dbg !55
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !56 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !61, metadata !DIExpression()), !dbg !62
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !63, metadata !DIExpression()), !dbg !64
  %call = call i64 @time(i64* noundef null), !dbg !65
  %conv = trunc i64 %call to i32, !dbg !66
  call void @srand(i32 noundef %conv), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13_good(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !71
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13_bad(), !dbg !72
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !73
  ret i32 0, !dbg !74
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !75 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !78
  store i8* %call, i8** %data, align 8, !dbg !79
  %0 = load i8*, i8** %data, align 8, !dbg !80
  %cmp = icmp eq i8* %0, null, !dbg !82
  br i1 %cmp, label %if.then, label %if.end, !dbg !83

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !84
  unreachable, !dbg !84

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !86
  %cmp1 = icmp ne i32 %1, 5, !dbg !88
  br i1 %cmp1, label %if.then2, label %if.else, !dbg !89

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end4, !dbg !92

if.else:                                          ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !93
  %3 = load i8*, i8** %data, align 8, !dbg !93
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !93
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !93
  %5 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !100
  %7 = load i8*, i8** %data, align 8, !dbg !100
  %8 = load i8*, i8** %data, align 8, !dbg !100
  %call5 = call i64 @strlen(i8* noundef %8), !dbg !100
  %call6 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %call5, i64 noundef 50) #9, !dbg !100
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !101
  store i8 0, i8* %arrayidx7, align 1, !dbg !102
  %9 = load i8*, i8** %data, align 8, !dbg !103
  call void @printLine(i8* noundef %9), !dbg !104
  %10 = load i8*, i8** %data, align 8, !dbg !105
  call void @free(i8* noundef %10), !dbg !106
  ret void, !dbg !107
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !108 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !109, metadata !DIExpression()), !dbg !110
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !111
  store i8* %call, i8** %data, align 8, !dbg !112
  %0 = load i8*, i8** %data, align 8, !dbg !113
  %cmp = icmp eq i8* %0, null, !dbg !115
  br i1 %cmp, label %if.then, label %if.end, !dbg !116

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !117
  unreachable, !dbg !117

if.end:                                           ; preds = %entry
  %1 = load i32, i32* @GLOBAL_CONST_FIVE, align 4, !dbg !119
  %cmp1 = icmp eq i32 %1, 5, !dbg !121
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !122

if.then2:                                         ; preds = %if.end
  %2 = load i8*, i8** %data, align 8, !dbg !123
  %3 = load i8*, i8** %data, align 8, !dbg !123
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !123
  %call3 = call i8* @__memset_chk(i8* noundef %2, i32 noundef 65, i64 noundef 49, i64 noundef %4) #9, !dbg !123
  %5 = load i8*, i8** %data, align 8, !dbg !125
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 49, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  br label %if.end4, !dbg !127

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !128, metadata !DIExpression()), !dbg !130
  %6 = bitcast [50 x i8]* %dest to i8*, !dbg !130
  call void @llvm.memset.p0i8.i64(i8* align 16 %6, i8 0, i64 50, i1 false), !dbg !130
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !131
  %7 = load i8*, i8** %data, align 8, !dbg !131
  %8 = load i8*, i8** %data, align 8, !dbg !131
  %call5 = call i64 @strlen(i8* noundef %8), !dbg !131
  %call6 = call i8* @__strncpy_chk(i8* noundef %arraydecay, i8* noundef %7, i64 noundef %call5, i64 noundef 50) #9, !dbg !131
  %arrayidx7 = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !132
  store i8 0, i8* %arrayidx7, align 1, !dbg !133
  %9 = load i8*, i8** %data, align 8, !dbg !134
  call void @printLine(i8* noundef %9), !dbg !135
  %10 = load i8*, i8** %data, align 8, !dbg !136
  call void @free(i8* noundef %10), !dbg !137
  ret void, !dbg !138
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn writeonly }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!2 = !{!3, !5, !6}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"PIC Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{i32 7, !"frame-pointer", i32 2}
!13 = !{!"Homebrew clang version 14.0.6"}
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13_bad", scope: !15, file: !15, line: 23, type: !16, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 25, type: !3)
!20 = !DILocation(line: 25, column: 12, scope: !14)
!21 = !DILocation(line: 26, column: 20, scope: !14)
!22 = !DILocation(line: 26, column: 10, scope: !14)
!23 = !DILocation(line: 27, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 27, column: 9)
!25 = !DILocation(line: 27, column: 14, scope: !24)
!26 = !DILocation(line: 27, column: 9, scope: !14)
!27 = !DILocation(line: 27, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 27, column: 23)
!29 = !DILocation(line: 28, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 28, column: 8)
!31 = !DILocation(line: 28, column: 25, scope: !30)
!32 = !DILocation(line: 28, column: 8, scope: !14)
!33 = !DILocation(line: 31, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !15, line: 29, column: 5)
!35 = !DILocation(line: 32, column: 9, scope: !34)
!36 = !DILocation(line: 32, column: 21, scope: !34)
!37 = !DILocation(line: 33, column: 5, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !15, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !14, file: !15, line: 34, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 35, column: 14, scope: !39)
!44 = !DILocation(line: 37, column: 9, scope: !39)
!45 = !DILocation(line: 38, column: 9, scope: !39)
!46 = !DILocation(line: 38, column: 20, scope: !39)
!47 = !DILocation(line: 39, column: 19, scope: !39)
!48 = !DILocation(line: 39, column: 9, scope: !39)
!49 = !DILocation(line: 40, column: 14, scope: !39)
!50 = !DILocation(line: 40, column: 9, scope: !39)
!51 = !DILocation(line: 42, column: 1, scope: !14)
!52 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_13_good", scope: !15, file: !15, line: 97, type: !16, scopeLine: 98, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!53 = !DILocation(line: 99, column: 5, scope: !52)
!54 = !DILocation(line: 100, column: 5, scope: !52)
!55 = !DILocation(line: 101, column: 1, scope: !52)
!56 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 113, type: !57, scopeLine: 114, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!57 = !DISubroutineType(types: !58)
!58 = !{!59, !59, !60}
!59 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!61 = !DILocalVariable(name: "argc", arg: 1, scope: !56, file: !15, line: 113, type: !59)
!62 = !DILocation(line: 113, column: 14, scope: !56)
!63 = !DILocalVariable(name: "argv", arg: 2, scope: !56, file: !15, line: 113, type: !60)
!64 = !DILocation(line: 113, column: 27, scope: !56)
!65 = !DILocation(line: 116, column: 22, scope: !56)
!66 = !DILocation(line: 116, column: 12, scope: !56)
!67 = !DILocation(line: 116, column: 5, scope: !56)
!68 = !DILocation(line: 118, column: 5, scope: !56)
!69 = !DILocation(line: 119, column: 5, scope: !56)
!70 = !DILocation(line: 120, column: 5, scope: !56)
!71 = !DILocation(line: 123, column: 5, scope: !56)
!72 = !DILocation(line: 124, column: 5, scope: !56)
!73 = !DILocation(line: 125, column: 5, scope: !56)
!74 = !DILocation(line: 127, column: 5, scope: !56)
!75 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 49, type: !16, scopeLine: 50, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!76 = !DILocalVariable(name: "data", scope: !75, file: !15, line: 51, type: !3)
!77 = !DILocation(line: 51, column: 12, scope: !75)
!78 = !DILocation(line: 52, column: 20, scope: !75)
!79 = !DILocation(line: 52, column: 10, scope: !75)
!80 = !DILocation(line: 53, column: 9, scope: !81)
!81 = distinct !DILexicalBlock(scope: !75, file: !15, line: 53, column: 9)
!82 = !DILocation(line: 53, column: 14, scope: !81)
!83 = !DILocation(line: 53, column: 9, scope: !75)
!84 = !DILocation(line: 53, column: 24, scope: !85)
!85 = distinct !DILexicalBlock(scope: !81, file: !15, line: 53, column: 23)
!86 = !DILocation(line: 54, column: 8, scope: !87)
!87 = distinct !DILexicalBlock(scope: !75, file: !15, line: 54, column: 8)
!88 = !DILocation(line: 54, column: 25, scope: !87)
!89 = !DILocation(line: 54, column: 8, scope: !75)
!90 = !DILocation(line: 57, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !15, line: 55, column: 5)
!92 = !DILocation(line: 58, column: 5, scope: !91)
!93 = !DILocation(line: 62, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !15, line: 60, column: 5)
!95 = !DILocation(line: 63, column: 9, scope: !94)
!96 = !DILocation(line: 63, column: 20, scope: !94)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !15, line: 66, type: !40)
!98 = distinct !DILexicalBlock(scope: !75, file: !15, line: 65, column: 5)
!99 = !DILocation(line: 66, column: 14, scope: !98)
!100 = !DILocation(line: 68, column: 9, scope: !98)
!101 = !DILocation(line: 69, column: 9, scope: !98)
!102 = !DILocation(line: 69, column: 20, scope: !98)
!103 = !DILocation(line: 70, column: 19, scope: !98)
!104 = !DILocation(line: 70, column: 9, scope: !98)
!105 = !DILocation(line: 71, column: 14, scope: !98)
!106 = !DILocation(line: 71, column: 9, scope: !98)
!107 = !DILocation(line: 73, column: 1, scope: !75)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 76, type: !16, scopeLine: 77, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 78, type: !3)
!110 = !DILocation(line: 78, column: 12, scope: !108)
!111 = !DILocation(line: 79, column: 20, scope: !108)
!112 = !DILocation(line: 79, column: 10, scope: !108)
!113 = !DILocation(line: 80, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !15, line: 80, column: 9)
!115 = !DILocation(line: 80, column: 14, scope: !114)
!116 = !DILocation(line: 80, column: 9, scope: !108)
!117 = !DILocation(line: 80, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 80, column: 23)
!119 = !DILocation(line: 81, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !108, file: !15, line: 81, column: 8)
!121 = !DILocation(line: 81, column: 25, scope: !120)
!122 = !DILocation(line: 81, column: 8, scope: !108)
!123 = !DILocation(line: 84, column: 9, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !15, line: 82, column: 5)
!125 = !DILocation(line: 85, column: 9, scope: !124)
!126 = !DILocation(line: 85, column: 20, scope: !124)
!127 = !DILocation(line: 86, column: 5, scope: !124)
!128 = !DILocalVariable(name: "dest", scope: !129, file: !15, line: 88, type: !40)
!129 = distinct !DILexicalBlock(scope: !108, file: !15, line: 87, column: 5)
!130 = !DILocation(line: 88, column: 14, scope: !129)
!131 = !DILocation(line: 90, column: 9, scope: !129)
!132 = !DILocation(line: 91, column: 9, scope: !129)
!133 = !DILocation(line: 91, column: 20, scope: !129)
!134 = !DILocation(line: 92, column: 19, scope: !129)
!135 = !DILocation(line: 92, column: 9, scope: !129)
!136 = !DILocation(line: 93, column: 14, scope: !129)
!137 = !DILocation(line: 93, column: 9, scope: !129)
!138 = !DILocation(line: 95, column: 1, scope: !108)
