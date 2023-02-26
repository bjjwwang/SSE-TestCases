; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08_bad() #0 !dbg !14 {
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
  %call1 = call i32 @staticReturnsTrue(), !dbg !29
  %tobool = icmp ne i32 %call1, 0, !dbg !29
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !31

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !32
  %2 = load i8*, i8** %data, align 8, !dbg !32
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !32
  %call3 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !32
  %4 = load i8*, i8** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !34
  store i8 0, i8* %arrayidx, align 1, !dbg !35
  br label %if.end4, !dbg !36

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !37, metadata !DIExpression()), !dbg !42
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %6 = load i8*, i8** %data, align 8, !dbg !43
  %call5 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef 50) #9, !dbg !43
  %7 = load i8*, i8** %data, align 8, !dbg !44
  call void @printLine(i8* noundef %7), !dbg !45
  %8 = load i8*, i8** %data, align 8, !dbg !46
  call void @free(i8* noundef %8), !dbg !47
  ret void, !dbg !48
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
declare i8* @__strcat_chk(i8* noundef, i8* noundef, i64 noundef) #4

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08_good() #0 !dbg !49 {
entry:
  call void @goodG2B1(), !dbg !50
  call void @goodG2B2(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !58, metadata !DIExpression()), !dbg !59
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !60, metadata !DIExpression()), !dbg !61
  %call = call i64 @time(i64* noundef null), !dbg !62
  %conv = trunc i64 %call to i32, !dbg !63
  call void @srand(i32 noundef %conv), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !65
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08_good(), !dbg !66
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !67
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !68
  call void @CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08_bad(), !dbg !69
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !70
  ret i32 0, !dbg !71
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !72 {
entry:
  ret i32 1, !dbg !75
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !76 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !77, metadata !DIExpression()), !dbg !78
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !79
  store i8* %call, i8** %data, align 8, !dbg !80
  %0 = load i8*, i8** %data, align 8, !dbg !81
  %cmp = icmp eq i8* %0, null, !dbg !83
  br i1 %cmp, label %if.then, label %if.end, !dbg !84

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !85
  unreachable, !dbg !85

if.end:                                           ; preds = %entry
  %call1 = call i32 @staticReturnsFalse(), !dbg !87
  %tobool = icmp ne i32 %call1, 0, !dbg !87
  br i1 %tobool, label %if.then2, label %if.else, !dbg !89

if.then2:                                         ; preds = %if.end
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  br label %if.end4, !dbg !92

if.else:                                          ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !93
  %2 = load i8*, i8** %data, align 8, !dbg !93
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !93
  %call3 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !93
  %4 = load i8*, i8** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !95
  store i8 0, i8* %arrayidx, align 1, !dbg !96
  br label %if.end4

if.end4:                                          ; preds = %if.else, %if.then2
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !97, metadata !DIExpression()), !dbg !99
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !99
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !100
  %6 = load i8*, i8** %data, align 8, !dbg !100
  %call5 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef 50) #9, !dbg !100
  %7 = load i8*, i8** %data, align 8, !dbg !101
  call void @printLine(i8* noundef %7), !dbg !102
  %8 = load i8*, i8** %data, align 8, !dbg !103
  call void @free(i8* noundef %8), !dbg !104
  ret void, !dbg !105
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !106 {
entry:
  ret i32 0, !dbg !107
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
  %call1 = call i32 @staticReturnsTrue(), !dbg !119
  %tobool = icmp ne i32 %call1, 0, !dbg !119
  br i1 %tobool, label %if.then2, label %if.end4, !dbg !121

if.then2:                                         ; preds = %if.end
  %1 = load i8*, i8** %data, align 8, !dbg !122
  %2 = load i8*, i8** %data, align 8, !dbg !122
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !122
  %call3 = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !122
  %4 = load i8*, i8** %data, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  br label %if.end4, !dbg !126

if.end4:                                          ; preds = %if.then2, %if.end
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !127, metadata !DIExpression()), !dbg !129
  %5 = bitcast [50 x i8]* %dest to i8*, !dbg !129
  call void @llvm.memset.p0i8.i64(i8* align 16 %5, i8 0, i64 50, i1 false), !dbg !129
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !130
  %6 = load i8*, i8** %data, align 8, !dbg !130
  %call5 = call i8* @__strcat_chk(i8* noundef %arraydecay, i8* noundef %6, i64 noundef 50) #9, !dbg !130
  %7 = load i8*, i8** %data, align 8, !dbg !131
  call void @printLine(i8* noundef %7), !dbg !132
  %8 = load i8*, i8** %data, align 8, !dbg !133
  call void @free(i8* noundef %8), !dbg !134
  ret void, !dbg !135
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
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08_bad", scope: !15, file: !15, line: 37, type: !16, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 39, type: !3)
!20 = !DILocation(line: 39, column: 12, scope: !14)
!21 = !DILocation(line: 40, column: 20, scope: !14)
!22 = !DILocation(line: 40, column: 10, scope: !14)
!23 = !DILocation(line: 41, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !14, file: !15, line: 41, column: 9)
!25 = !DILocation(line: 41, column: 14, scope: !24)
!26 = !DILocation(line: 41, column: 9, scope: !14)
!27 = !DILocation(line: 41, column: 24, scope: !28)
!28 = distinct !DILexicalBlock(scope: !24, file: !15, line: 41, column: 23)
!29 = !DILocation(line: 42, column: 8, scope: !30)
!30 = distinct !DILexicalBlock(scope: !14, file: !15, line: 42, column: 8)
!31 = !DILocation(line: 42, column: 8, scope: !14)
!32 = !DILocation(line: 45, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !30, file: !15, line: 43, column: 5)
!34 = !DILocation(line: 46, column: 9, scope: !33)
!35 = !DILocation(line: 46, column: 21, scope: !33)
!36 = !DILocation(line: 47, column: 5, scope: !33)
!37 = !DILocalVariable(name: "dest", scope: !38, file: !15, line: 49, type: !39)
!38 = distinct !DILexicalBlock(scope: !14, file: !15, line: 48, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 50)
!42 = !DILocation(line: 49, column: 14, scope: !38)
!43 = !DILocation(line: 51, column: 9, scope: !38)
!44 = !DILocation(line: 52, column: 19, scope: !38)
!45 = !DILocation(line: 52, column: 9, scope: !38)
!46 = !DILocation(line: 53, column: 14, scope: !38)
!47 = !DILocation(line: 53, column: 9, scope: !38)
!48 = !DILocation(line: 55, column: 1, scope: !14)
!49 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_src_char_cat_08_good", scope: !15, file: !15, line: 108, type: !16, scopeLine: 109, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!50 = !DILocation(line: 110, column: 5, scope: !49)
!51 = !DILocation(line: 111, column: 5, scope: !49)
!52 = !DILocation(line: 112, column: 1, scope: !49)
!53 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 124, type: !54, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!58 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !15, line: 124, type: !56)
!59 = !DILocation(line: 124, column: 14, scope: !53)
!60 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !15, line: 124, type: !57)
!61 = !DILocation(line: 124, column: 27, scope: !53)
!62 = !DILocation(line: 127, column: 22, scope: !53)
!63 = !DILocation(line: 127, column: 12, scope: !53)
!64 = !DILocation(line: 127, column: 5, scope: !53)
!65 = !DILocation(line: 129, column: 5, scope: !53)
!66 = !DILocation(line: 130, column: 5, scope: !53)
!67 = !DILocation(line: 131, column: 5, scope: !53)
!68 = !DILocation(line: 134, column: 5, scope: !53)
!69 = !DILocation(line: 135, column: 5, scope: !53)
!70 = !DILocation(line: 136, column: 5, scope: !53)
!71 = !DILocation(line: 138, column: 5, scope: !53)
!72 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !15, file: !15, line: 25, type: !73, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!73 = !DISubroutineType(types: !74)
!74 = !{!56}
!75 = !DILocation(line: 27, column: 5, scope: !72)
!76 = distinct !DISubprogram(name: "goodG2B1", scope: !15, file: !15, line: 62, type: !16, scopeLine: 63, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!77 = !DILocalVariable(name: "data", scope: !76, file: !15, line: 64, type: !3)
!78 = !DILocation(line: 64, column: 12, scope: !76)
!79 = !DILocation(line: 65, column: 20, scope: !76)
!80 = !DILocation(line: 65, column: 10, scope: !76)
!81 = !DILocation(line: 66, column: 9, scope: !82)
!82 = distinct !DILexicalBlock(scope: !76, file: !15, line: 66, column: 9)
!83 = !DILocation(line: 66, column: 14, scope: !82)
!84 = !DILocation(line: 66, column: 9, scope: !76)
!85 = !DILocation(line: 66, column: 24, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !15, line: 66, column: 23)
!87 = !DILocation(line: 67, column: 8, scope: !88)
!88 = distinct !DILexicalBlock(scope: !76, file: !15, line: 67, column: 8)
!89 = !DILocation(line: 67, column: 8, scope: !76)
!90 = !DILocation(line: 70, column: 9, scope: !91)
!91 = distinct !DILexicalBlock(scope: !88, file: !15, line: 68, column: 5)
!92 = !DILocation(line: 71, column: 5, scope: !91)
!93 = !DILocation(line: 75, column: 9, scope: !94)
!94 = distinct !DILexicalBlock(scope: !88, file: !15, line: 73, column: 5)
!95 = !DILocation(line: 76, column: 9, scope: !94)
!96 = !DILocation(line: 76, column: 20, scope: !94)
!97 = !DILocalVariable(name: "dest", scope: !98, file: !15, line: 79, type: !39)
!98 = distinct !DILexicalBlock(scope: !76, file: !15, line: 78, column: 5)
!99 = !DILocation(line: 79, column: 14, scope: !98)
!100 = !DILocation(line: 81, column: 9, scope: !98)
!101 = !DILocation(line: 82, column: 19, scope: !98)
!102 = !DILocation(line: 82, column: 9, scope: !98)
!103 = !DILocation(line: 83, column: 14, scope: !98)
!104 = !DILocation(line: 83, column: 9, scope: !98)
!105 = !DILocation(line: 85, column: 1, scope: !76)
!106 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !15, file: !15, line: 30, type: !73, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!107 = !DILocation(line: 32, column: 5, scope: !106)
!108 = distinct !DISubprogram(name: "goodG2B2", scope: !15, file: !15, line: 88, type: !16, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!109 = !DILocalVariable(name: "data", scope: !108, file: !15, line: 90, type: !3)
!110 = !DILocation(line: 90, column: 12, scope: !108)
!111 = !DILocation(line: 91, column: 20, scope: !108)
!112 = !DILocation(line: 91, column: 10, scope: !108)
!113 = !DILocation(line: 92, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !108, file: !15, line: 92, column: 9)
!115 = !DILocation(line: 92, column: 14, scope: !114)
!116 = !DILocation(line: 92, column: 9, scope: !108)
!117 = !DILocation(line: 92, column: 24, scope: !118)
!118 = distinct !DILexicalBlock(scope: !114, file: !15, line: 92, column: 23)
!119 = !DILocation(line: 93, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !108, file: !15, line: 93, column: 8)
!121 = !DILocation(line: 93, column: 8, scope: !108)
!122 = !DILocation(line: 96, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !15, line: 94, column: 5)
!124 = !DILocation(line: 97, column: 9, scope: !123)
!125 = !DILocation(line: 97, column: 20, scope: !123)
!126 = !DILocation(line: 98, column: 5, scope: !123)
!127 = !DILocalVariable(name: "dest", scope: !128, file: !15, line: 100, type: !39)
!128 = distinct !DILexicalBlock(scope: !108, file: !15, line: 99, column: 5)
!129 = !DILocation(line: 100, column: 14, scope: !128)
!130 = !DILocation(line: 102, column: 9, scope: !128)
!131 = !DILocation(line: 103, column: 19, scope: !128)
!132 = !DILocation(line: 103, column: 9, scope: !128)
!133 = !DILocation(line: 104, column: 14, scope: !128)
!134 = !DILocation(line: 104, column: 9, scope: !128)
!135 = !DILocation(line: 106, column: 1, scope: !108)
