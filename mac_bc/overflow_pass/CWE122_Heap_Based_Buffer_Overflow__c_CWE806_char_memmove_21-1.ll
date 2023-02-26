; ModuleID = 'mac_bc/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !10
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !14

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !27, metadata !DIExpression()), !dbg !28
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !29
  store i8* %call, i8** %data, align 8, !dbg !30
  %0 = load i8*, i8** %data, align 8, !dbg !31
  %cmp = icmp eq i8* %0, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %entry
  store i32 1, i32* @badStatic, align 4, !dbg !37
  %1 = load i8*, i8** %data, align 8, !dbg !38
  %call1 = call i8* @badSource(i8* noundef %1), !dbg !39
  store i8* %call1, i8** %data, align 8, !dbg !40
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !46
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !46
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !47
  %3 = load i8*, i8** %data, align 8, !dbg !47
  %4 = load i8*, i8** %data, align 8, !dbg !47
  %call2 = call i64 @strlen(i8* noundef %4), !dbg !47
  %mul = mul i64 %call2, 1, !dbg !47
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %3, i64 noundef %mul, i64 noundef 50) #9, !dbg !47
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %5 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* noundef %5), !dbg !51
  %6 = load i8*, i8** %data, align 8, !dbg !52
  call void @free(i8* noundef %6), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

; Function Attrs: noreturn
declare void @exit(i32 noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @badSource(i8* noundef %data) #0 !dbg !55 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !58, metadata !DIExpression()), !dbg !59
  %0 = load i32, i32* @badStatic, align 4, !dbg !60
  %tobool = icmp ne i32 %0, 0, !dbg !60
  br i1 %tobool, label %if.then, label %if.end, !dbg !62

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !63
  %2 = load i8*, i8** %data.addr, align 8, !dbg !63
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !63
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 99, i64 noundef %3) #9, !dbg !63
  %4 = load i8*, i8** %data.addr, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 99, !dbg !65
  store i8 0, i8* %arrayidx, align 1, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !68
  ret i8* %5, !dbg !69
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: nounwind
declare i8* @__memmove_chk(i8* noundef, i8* noundef, i64 noundef, i64 noundef) #5

declare i64 @strlen(i8* noundef) #6

declare void @printLine(i8* noundef) #6

declare void @free(i8* noundef) #6

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main(i32 noundef %argc, i8** noundef %argv) #0 !dbg !74 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* noundef null), !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 noundef %conv), !dbg !84
  call void @printLine(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21_good(), !dbg !86
  call void @printLine(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* noundef getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21_bad(), !dbg !89
  call void @printLine(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

declare void @srand(i32 noundef) #6

declare i64 @time(i64* noundef) #6

; Function Attrs: nounwind
declare i8* @__memset_chk(i8* noundef, i32 noundef, i64 noundef, i64 noundef) #5

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare i64 @llvm.objectsize.i64.p0i8(i8*, i1 immarg, i1 immarg, i1 immarg) #1

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !95
  store i8* %call, i8** %data, align 8, !dbg !96
  %0 = load i8*, i8** %data, align 8, !dbg !97
  %cmp = icmp eq i8* %0, null, !dbg !99
  br i1 %cmp, label %if.then, label %if.end, !dbg !100

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !101
  unreachable, !dbg !101

if.end:                                           ; preds = %entry
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !103
  %1 = load i8*, i8** %data, align 8, !dbg !104
  %call1 = call i8* @goodG2B1Source(i8* noundef %1), !dbg !105
  store i8* %call1, i8** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !110
  %3 = load i8*, i8** %data, align 8, !dbg !110
  %4 = load i8*, i8** %data, align 8, !dbg !110
  %call2 = call i64 @strlen(i8* noundef %4), !dbg !110
  %mul = mul i64 %call2, 1, !dbg !110
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %3, i64 noundef %mul, i64 noundef 50) #9, !dbg !110
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !111
  store i8 0, i8* %arrayidx, align 1, !dbg !112
  %5 = load i8*, i8** %data, align 8, !dbg !113
  call void @printLine(i8* noundef %5), !dbg !114
  %6 = load i8*, i8** %data, align 8, !dbg !115
  call void @free(i8* noundef %6), !dbg !116
  ret void, !dbg !117
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @goodG2B1Source(i8* noundef %data) #0 !dbg !118 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !119, metadata !DIExpression()), !dbg !120
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !121
  %tobool = icmp ne i32 %0, 0, !dbg !121
  br i1 %tobool, label %if.then, label %if.else, !dbg !123

if.then:                                          ; preds = %entry
  call void @printLine(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !124
  br label %if.end, !dbg !126

if.else:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !127
  %2 = load i8*, i8** %data.addr, align 8, !dbg !127
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !127
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !127
  %4 = load i8*, i8** %data.addr, align 8, !dbg !129
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %5 = load i8*, i8** %data.addr, align 8, !dbg !131
  ret i8* %5, !dbg !132
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !134, metadata !DIExpression()), !dbg !135
  %call = call i8* @malloc(i64 noundef 100) #7, !dbg !136
  store i8* %call, i8** %data, align 8, !dbg !137
  %0 = load i8*, i8** %data, align 8, !dbg !138
  %cmp = icmp eq i8* %0, null, !dbg !140
  br i1 %cmp, label %if.then, label %if.end, !dbg !141

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef -1) #8, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %entry
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !144
  %1 = load i8*, i8** %data, align 8, !dbg !145
  %call1 = call i8* @goodG2B2Source(i8* noundef %1), !dbg !146
  store i8* %call1, i8** %data, align 8, !dbg !147
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !148, metadata !DIExpression()), !dbg !150
  %2 = bitcast [50 x i8]* %dest to i8*, !dbg !150
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 50, i1 false), !dbg !150
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !151
  %3 = load i8*, i8** %data, align 8, !dbg !151
  %4 = load i8*, i8** %data, align 8, !dbg !151
  %call2 = call i64 @strlen(i8* noundef %4), !dbg !151
  %mul = mul i64 %call2, 1, !dbg !151
  %call3 = call i8* @__memmove_chk(i8* noundef %arraydecay, i8* noundef %3, i64 noundef %mul, i64 noundef 50) #9, !dbg !151
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !152
  store i8 0, i8* %arrayidx, align 1, !dbg !153
  %5 = load i8*, i8** %data, align 8, !dbg !154
  call void @printLine(i8* noundef %5), !dbg !155
  %6 = load i8*, i8** %data, align 8, !dbg !156
  call void @free(i8* noundef %6), !dbg !157
  ret void, !dbg !158
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define internal i8* @goodG2B2Source(i8* noundef %data) #0 !dbg !159 {
entry:
  %data.addr = alloca i8*, align 8
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !162
  %tobool = icmp ne i32 %0, 0, !dbg !162
  br i1 %tobool, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %data.addr, align 8, !dbg !165
  %2 = load i8*, i8** %data.addr, align 8, !dbg !165
  %3 = call i64 @llvm.objectsize.i64.p0i8(i8* %2, i1 false, i1 true, i1 false), !dbg !165
  %call = call i8* @__memset_chk(i8* noundef %1, i32 noundef 65, i64 noundef 49, i64 noundef %3) #9, !dbg !165
  %4 = load i8*, i8** %data.addr, align 8, !dbg !167
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 49, !dbg !167
  store i8 0, i8* %arrayidx, align 1, !dbg !168
  br label %if.end, !dbg !169

if.end:                                           ; preds = %if.then, %entry
  %5 = load i8*, i8** %data.addr, align 8, !dbg !170
  ret i8* %5, !dbg !171
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #7 = { allocsize(0) }
attributes #8 = { noreturn }
attributes #9 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!16, !17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !12, line: 24, type: !13, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !4, globals: !9, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!3 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases/src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!4 = !{!5, !7, !8}
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!6 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!7 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10, !14}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !12, line: 59, type: !13, isLocal: true, isDefinition: true)
!12 = !DIFile(filename: "src/overflow_pass/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21-1.c", directory: "/Users/jiaweiwang/CLionProjects/0130-db/svf-z3/SSE-TestCases")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !12, line: 60, type: !13, isLocal: true, isDefinition: true)
!16 = !{i32 7, !"Dwarf Version", i32 4}
!17 = !{i32 2, !"Debug Info Version", i32 3}
!18 = !{i32 1, !"wchar_size", i32 4}
!19 = !{i32 7, !"PIC Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"Homebrew clang version 14.0.6"}
!23 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21_bad", scope: !12, file: !12, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !{}
!27 = !DILocalVariable(name: "data", scope: !23, file: !12, line: 39, type: !5)
!28 = !DILocation(line: 39, column: 12, scope: !23)
!29 = !DILocation(line: 40, column: 20, scope: !23)
!30 = !DILocation(line: 40, column: 10, scope: !23)
!31 = !DILocation(line: 41, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !23, file: !12, line: 41, column: 9)
!33 = !DILocation(line: 41, column: 14, scope: !32)
!34 = !DILocation(line: 41, column: 9, scope: !23)
!35 = !DILocation(line: 41, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 41, column: 23)
!37 = !DILocation(line: 42, column: 15, scope: !23)
!38 = !DILocation(line: 43, column: 22, scope: !23)
!39 = !DILocation(line: 43, column: 12, scope: !23)
!40 = !DILocation(line: 43, column: 10, scope: !23)
!41 = !DILocalVariable(name: "dest", scope: !42, file: !12, line: 45, type: !43)
!42 = distinct !DILexicalBlock(scope: !23, file: !12, line: 44, column: 5)
!43 = !DICompositeType(tag: DW_TAG_array_type, baseType: !6, size: 400, elements: !44)
!44 = !{!45}
!45 = !DISubrange(count: 50)
!46 = !DILocation(line: 45, column: 14, scope: !42)
!47 = !DILocation(line: 47, column: 9, scope: !42)
!48 = !DILocation(line: 48, column: 9, scope: !42)
!49 = !DILocation(line: 48, column: 20, scope: !42)
!50 = !DILocation(line: 49, column: 19, scope: !42)
!51 = !DILocation(line: 49, column: 9, scope: !42)
!52 = !DILocation(line: 50, column: 14, scope: !42)
!53 = !DILocation(line: 50, column: 9, scope: !42)
!54 = !DILocation(line: 52, column: 1, scope: !23)
!55 = distinct !DISubprogram(name: "badSource", scope: !12, file: !12, line: 26, type: !56, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!56 = !DISubroutineType(types: !57)
!57 = !{!5, !5}
!58 = !DILocalVariable(name: "data", arg: 1, scope: !55, file: !12, line: 26, type: !5)
!59 = !DILocation(line: 26, column: 32, scope: !55)
!60 = !DILocation(line: 28, column: 8, scope: !61)
!61 = distinct !DILexicalBlock(scope: !55, file: !12, line: 28, column: 8)
!62 = !DILocation(line: 28, column: 8, scope: !55)
!63 = !DILocation(line: 31, column: 9, scope: !64)
!64 = distinct !DILexicalBlock(scope: !61, file: !12, line: 29, column: 5)
!65 = !DILocation(line: 32, column: 9, scope: !64)
!66 = !DILocation(line: 32, column: 21, scope: !64)
!67 = !DILocation(line: 33, column: 5, scope: !64)
!68 = !DILocation(line: 34, column: 12, scope: !55)
!69 = !DILocation(line: 34, column: 5, scope: !55)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_memmove_21_good", scope: !12, file: !12, line: 125, type: !24, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!71 = !DILocation(line: 127, column: 5, scope: !70)
!72 = !DILocation(line: 128, column: 5, scope: !70)
!73 = !DILocation(line: 129, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 141, type: !75, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !26)
!75 = !DISubroutineType(types: !76)
!76 = !{!13, !13, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 141, type: !13)
!79 = !DILocation(line: 141, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 141, type: !77)
!81 = !DILocation(line: 141, column: 27, scope: !74)
!82 = !DILocation(line: 144, column: 22, scope: !74)
!83 = !DILocation(line: 144, column: 12, scope: !74)
!84 = !DILocation(line: 144, column: 5, scope: !74)
!85 = !DILocation(line: 146, column: 5, scope: !74)
!86 = !DILocation(line: 147, column: 5, scope: !74)
!87 = !DILocation(line: 148, column: 5, scope: !74)
!88 = !DILocation(line: 151, column: 5, scope: !74)
!89 = !DILocation(line: 152, column: 5, scope: !74)
!90 = !DILocation(line: 153, column: 5, scope: !74)
!91 = !DILocation(line: 155, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 79, type: !24, scopeLine: 80, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!93 = !DILocalVariable(name: "data", scope: !92, file: !12, line: 81, type: !5)
!94 = !DILocation(line: 81, column: 12, scope: !92)
!95 = !DILocation(line: 82, column: 20, scope: !92)
!96 = !DILocation(line: 82, column: 10, scope: !92)
!97 = !DILocation(line: 83, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !92, file: !12, line: 83, column: 9)
!99 = !DILocation(line: 83, column: 14, scope: !98)
!100 = !DILocation(line: 83, column: 9, scope: !92)
!101 = !DILocation(line: 83, column: 24, scope: !102)
!102 = distinct !DILexicalBlock(scope: !98, file: !12, line: 83, column: 23)
!103 = !DILocation(line: 84, column: 20, scope: !92)
!104 = !DILocation(line: 85, column: 27, scope: !92)
!105 = !DILocation(line: 85, column: 12, scope: !92)
!106 = !DILocation(line: 85, column: 10, scope: !92)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !12, line: 87, type: !43)
!108 = distinct !DILexicalBlock(scope: !92, file: !12, line: 86, column: 5)
!109 = !DILocation(line: 87, column: 14, scope: !108)
!110 = !DILocation(line: 89, column: 9, scope: !108)
!111 = !DILocation(line: 90, column: 9, scope: !108)
!112 = !DILocation(line: 90, column: 20, scope: !108)
!113 = !DILocation(line: 91, column: 19, scope: !108)
!114 = !DILocation(line: 91, column: 9, scope: !108)
!115 = !DILocation(line: 92, column: 14, scope: !108)
!116 = !DILocation(line: 92, column: 9, scope: !108)
!117 = !DILocation(line: 94, column: 1, scope: !92)
!118 = distinct !DISubprogram(name: "goodG2B1Source", scope: !12, file: !12, line: 63, type: !56, scopeLine: 64, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!119 = !DILocalVariable(name: "data", arg: 1, scope: !118, file: !12, line: 63, type: !5)
!120 = !DILocation(line: 63, column: 37, scope: !118)
!121 = !DILocation(line: 65, column: 8, scope: !122)
!122 = distinct !DILexicalBlock(scope: !118, file: !12, line: 65, column: 8)
!123 = !DILocation(line: 65, column: 8, scope: !118)
!124 = !DILocation(line: 68, column: 9, scope: !125)
!125 = distinct !DILexicalBlock(scope: !122, file: !12, line: 66, column: 5)
!126 = !DILocation(line: 69, column: 5, scope: !125)
!127 = !DILocation(line: 73, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !122, file: !12, line: 71, column: 5)
!129 = !DILocation(line: 74, column: 9, scope: !128)
!130 = !DILocation(line: 74, column: 20, scope: !128)
!131 = !DILocation(line: 76, column: 12, scope: !118)
!132 = !DILocation(line: 76, column: 5, scope: !118)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 108, type: !24, scopeLine: 109, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!134 = !DILocalVariable(name: "data", scope: !133, file: !12, line: 110, type: !5)
!135 = !DILocation(line: 110, column: 12, scope: !133)
!136 = !DILocation(line: 111, column: 20, scope: !133)
!137 = !DILocation(line: 111, column: 10, scope: !133)
!138 = !DILocation(line: 112, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !12, line: 112, column: 9)
!140 = !DILocation(line: 112, column: 14, scope: !139)
!141 = !DILocation(line: 112, column: 9, scope: !133)
!142 = !DILocation(line: 112, column: 24, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !12, line: 112, column: 23)
!144 = !DILocation(line: 113, column: 20, scope: !133)
!145 = !DILocation(line: 114, column: 27, scope: !133)
!146 = !DILocation(line: 114, column: 12, scope: !133)
!147 = !DILocation(line: 114, column: 10, scope: !133)
!148 = !DILocalVariable(name: "dest", scope: !149, file: !12, line: 116, type: !43)
!149 = distinct !DILexicalBlock(scope: !133, file: !12, line: 115, column: 5)
!150 = !DILocation(line: 116, column: 14, scope: !149)
!151 = !DILocation(line: 118, column: 9, scope: !149)
!152 = !DILocation(line: 119, column: 9, scope: !149)
!153 = !DILocation(line: 119, column: 20, scope: !149)
!154 = !DILocation(line: 120, column: 19, scope: !149)
!155 = !DILocation(line: 120, column: 9, scope: !149)
!156 = !DILocation(line: 121, column: 14, scope: !149)
!157 = !DILocation(line: 121, column: 9, scope: !149)
!158 = !DILocation(line: 123, column: 1, scope: !133)
!159 = distinct !DISubprogram(name: "goodG2B2Source", scope: !12, file: !12, line: 97, type: !56, scopeLine: 98, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !26)
!160 = !DILocalVariable(name: "data", arg: 1, scope: !159, file: !12, line: 97, type: !5)
!161 = !DILocation(line: 97, column: 37, scope: !159)
!162 = !DILocation(line: 99, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 99, column: 8)
!164 = !DILocation(line: 99, column: 8, scope: !159)
!165 = !DILocation(line: 102, column: 9, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 100, column: 5)
!167 = !DILocation(line: 103, column: 9, scope: !166)
!168 = !DILocation(line: 103, column: 20, scope: !166)
!169 = !DILocation(line: 104, column: 5, scope: !166)
!170 = !DILocation(line: 105, column: 12, scope: !159)
!171 = !DILocation(line: 105, column: 5, scope: !159)
