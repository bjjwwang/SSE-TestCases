; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@__const.goodG2B.source = private unnamed_addr constant [11 x i8] c"AAAAAAAAAA\00", align 1

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad() #0 !dbg !14 {
entry:
  %data = alloca i8*, align 8
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !19, metadata !DIExpression()), !dbg !20
  store i8* null, i8** %data, align 8, !dbg !21
  br label %source, !dbg !22

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !23), !dbg !24
  %call = call i8* @malloc(i64 noundef 10) #7, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  %cmp = icmp eq i8* %0, null, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %source
  call void @exit(i32 noundef -1) #8, !dbg !31
  unreachable, !dbg !31

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !33, metadata !DIExpression()), !dbg !38
  %1 = bitcast [11 x i8]* %source1 to i8*, !dbg !38
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad.source, i32 0, i32 0), i64 11, i1 false), !dbg !38
  %2 = load i8*, i8** %data, align 8, !dbg !39
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !39
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !39
  %call3 = call i64 @strlen(i8* noundef %arraydecay2), !dbg !39
  %add = add i64 %call3, 1, !dbg !39
  %3 = load i8*, i8** %data, align 8, !dbg !39
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !39
  %call4 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %4) #9, !dbg !39
  %5 = load i8*, i8** %data, align 8, !dbg !40
  call void @printLine(i8* noundef %5), !dbg !41
  %6 = load i8*, i8** %data, align 8, !dbg !42
  call void @free(i8* noundef %6), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__strncpy_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @strlen(i8* noundef) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_good() #0 !dbg !45 {
entry:
  call void @goodG2B(), !dbg !46
  ret void, !dbg !47
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !48 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !53, metadata !DIExpression()), !dbg !54
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %call = call i64 @time(i64* noundef null), !dbg !57
  %conv = trunc i64 %call to i32, !dbg !58
  call void @srand(i32 noundef %conv), !dbg !59
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_good(), !dbg !61
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !62
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !63
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad(), !dbg !64
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !65
  ret i32 0, !dbg !66
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B() #0 !dbg !67 {
entry:
  %data = alloca i8*, align 8
  %source1 = alloca [11 x i8], align 1
  call void @llvm.dbg.declare(metadata i8** %data, metadata !68, metadata !DIExpression()), !dbg !69
  store i8* null, i8** %data, align 8, !dbg !70
  br label %source, !dbg !71

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !72), !dbg !73
  %call = call i8* @malloc(i64 noundef 11) #7, !dbg !74
  store i8* %call, i8** %data, align 8, !dbg !75
  %0 = load i8*, i8** %data, align 8, !dbg !76
  %cmp = icmp eq i8* %0, null, !dbg !78
  br i1 %cmp, label %if.then, label %if.end, !dbg !79

if.then:                                          ; preds = %source
  call void @exit(i32 noundef -1) #8, !dbg !80
  unreachable, !dbg !80

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [11 x i8]* %source1, metadata !82, metadata !DIExpression()), !dbg !84
  %1 = bitcast [11 x i8]* %source1 to i8*, !dbg !84
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %1, i8* align 1 getelementptr inbounds ([11 x i8], [11 x i8]* @__const.goodG2B.source, i32 0, i32 0), i64 11, i1 false), !dbg !84
  %2 = load i8*, i8** %data, align 8, !dbg !85
  %arraydecay = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !85
  %arraydecay2 = getelementptr inbounds [11 x i8], [11 x i8]* %source1, i64 0, i64 0, !dbg !85
  %call3 = call i64 @strlen(i8* noundef %arraydecay2), !dbg !85
  %add = add i64 %call3, 1, !dbg !85
  %3 = load i8*, i8** %data, align 8, !dbg !85
  %4 = call i64 @llvm.objectsize.i64.p0i8(i8* %3, i1 false, i1 true, i1 false), !dbg !85
  %call4 = call i8* @__strncpy_chk(i8* noundef %2, i8* noundef %arraydecay, i64 noundef %add, i64 noundef %4) #9, !dbg !85
  %5 = load i8*, i8** %data, align 8, !dbg !86
  call void @printLine(i8* noundef %5), !dbg !87
  %6 = load i8*, i8** %data, align 8, !dbg !88
  call void @free(i8* noundef %6), !dbg !89
  ret void, !dbg !90
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11, !12}
!llvm.ident = !{!13}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
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
!14 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_bad", scope: !15, file: !15, line: 28, type: !16, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!15 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!16 = !DISubroutineType(types: !17)
!17 = !{null}
!18 = !{}
!19 = !DILocalVariable(name: "data", scope: !14, file: !15, line: 30, type: !3)
!20 = !DILocation(line: 30, column: 12, scope: !14)
!21 = !DILocation(line: 31, column: 10, scope: !14)
!22 = !DILocation(line: 32, column: 5, scope: !14)
!23 = !DILabel(scope: !14, name: "source", file: !15, line: 33)
!24 = !DILocation(line: 33, column: 1, scope: !14)
!25 = !DILocation(line: 35, column: 20, scope: !14)
!26 = !DILocation(line: 35, column: 10, scope: !14)
!27 = !DILocation(line: 36, column: 9, scope: !28)
!28 = distinct !DILexicalBlock(scope: !14, file: !15, line: 36, column: 9)
!29 = !DILocation(line: 36, column: 14, scope: !28)
!30 = !DILocation(line: 36, column: 9, scope: !14)
!31 = !DILocation(line: 36, column: 24, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !15, line: 36, column: 23)
!33 = !DILocalVariable(name: "source", scope: !34, file: !15, line: 38, type: !35)
!34 = distinct !DILexicalBlock(scope: !14, file: !15, line: 37, column: 5)
!35 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !36)
!36 = !{!37}
!37 = !DISubrange(count: 11)
!38 = !DILocation(line: 38, column: 14, scope: !34)
!39 = !DILocation(line: 41, column: 9, scope: !34)
!40 = !DILocation(line: 42, column: 19, scope: !34)
!41 = !DILocation(line: 42, column: 9, scope: !34)
!42 = !DILocation(line: 43, column: 14, scope: !34)
!43 = !DILocation(line: 43, column: 9, scope: !34)
!44 = !DILocation(line: 45, column: 1, scope: !14)
!45 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_ncpy_18_good", scope: !15, file: !15, line: 71, type: !16, scopeLine: 72, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!46 = !DILocation(line: 73, column: 5, scope: !45)
!47 = !DILocation(line: 74, column: 1, scope: !45)
!48 = distinct !DISubprogram(name: "main", scope: !15, file: !15, line: 86, type: !49, scopeLine: 87, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !18)
!49 = !DISubroutineType(types: !50)
!50 = !{!51, !51, !52}
!51 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!52 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3, size: 64)
!53 = !DILocalVariable(name: "argc", arg: 1, scope: !48, file: !15, line: 86, type: !51)
!54 = !DILocation(line: 86, column: 14, scope: !48)
!55 = !DILocalVariable(name: "argv", arg: 2, scope: !48, file: !15, line: 86, type: !52)
!56 = !DILocation(line: 86, column: 27, scope: !48)
!57 = !DILocation(line: 89, column: 22, scope: !48)
!58 = !DILocation(line: 89, column: 12, scope: !48)
!59 = !DILocation(line: 89, column: 5, scope: !48)
!60 = !DILocation(line: 91, column: 5, scope: !48)
!61 = !DILocation(line: 92, column: 5, scope: !48)
!62 = !DILocation(line: 93, column: 5, scope: !48)
!63 = !DILocation(line: 96, column: 5, scope: !48)
!64 = !DILocation(line: 97, column: 5, scope: !48)
!65 = !DILocation(line: 98, column: 5, scope: !48)
!66 = !DILocation(line: 100, column: 5, scope: !48)
!67 = distinct !DISubprogram(name: "goodG2B", scope: !15, file: !15, line: 52, type: !16, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !18)
!68 = !DILocalVariable(name: "data", scope: !67, file: !15, line: 54, type: !3)
!69 = !DILocation(line: 54, column: 12, scope: !67)
!70 = !DILocation(line: 55, column: 10, scope: !67)
!71 = !DILocation(line: 56, column: 5, scope: !67)
!72 = !DILabel(scope: !67, name: "source", file: !15, line: 57)
!73 = !DILocation(line: 57, column: 1, scope: !67)
!74 = !DILocation(line: 59, column: 20, scope: !67)
!75 = !DILocation(line: 59, column: 10, scope: !67)
!76 = !DILocation(line: 60, column: 9, scope: !77)
!77 = distinct !DILexicalBlock(scope: !67, file: !15, line: 60, column: 9)
!78 = !DILocation(line: 60, column: 14, scope: !77)
!79 = !DILocation(line: 60, column: 9, scope: !67)
!80 = !DILocation(line: 60, column: 24, scope: !81)
!81 = distinct !DILexicalBlock(scope: !77, file: !15, line: 60, column: 23)
!82 = !DILocalVariable(name: "source", scope: !83, file: !15, line: 62, type: !35)
!83 = distinct !DILexicalBlock(scope: !67, file: !15, line: 61, column: 5)
!84 = !DILocation(line: 62, column: 14, scope: !83)
!85 = !DILocation(line: 65, column: 9, scope: !83)
!86 = !DILocation(line: 66, column: 19, scope: !83)
!87 = !DILocation(line: 66, column: 9, scope: !83)
!88 = !DILocation(line: 67, column: 14, scope: !83)
!89 = !DILocation(line: 67, column: 9, scope: !83)
!90 = !DILocation(line: 69, column: 1, scope: !67)
