; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_23-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_23-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%1c\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"aaaaa %d aaaaa\0A\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"%s %d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !11 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca i8*, align 8
  %ch = alloca i8, align 1
  %a = alloca i32, align 4
  %nb = alloca [10 x i8], align 1
  %b = alloca i32, align 4
  %newBuffer = alloca [50 x i32], align 16
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i8** %buffer, metadata !14, metadata !DIExpression()), !dbg !17
  %call = call noalias align 16 i8* @malloc(i64 50) #4, !dbg !18
  store i8* %call, i8** %buffer, align 8, !dbg !17
  call void @llvm.dbg.declare(metadata i8* %ch, metadata !19, metadata !DIExpression()), !dbg !20
  %call1 = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i8* %ch), !dbg !21
  call void @llvm.dbg.declare(metadata i32* %a, metadata !22, metadata !DIExpression()), !dbg !23
  %0 = load i8, i8* %ch, align 1, !dbg !24
  %conv = sext i8 %0 to i32, !dbg !25
  store i32 %conv, i32* %a, align 4, !dbg !23
  %1 = load i8*, i8** %buffer, align 8, !dbg !26
  %2 = load i32, i32* %a, align 4, !dbg !27
  %call2 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %1, i64 50, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0), i32 %2) #4, !dbg !28
  call void @llvm.dbg.declare(metadata [10 x i8]* %nb, metadata !29, metadata !DIExpression()), !dbg !33
  call void @llvm.dbg.declare(metadata i32* %b, metadata !34, metadata !DIExpression()), !dbg !35
  %3 = load i8*, i8** %buffer, align 8, !dbg !36
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %nb, i64 0, i64 0, !dbg !37
  %call3 = call i32 (i8*, i8*, ...) @__isoc99_sscanf(i8* %3, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.2, i64 0, i64 0), i8* %arraydecay, i32* %b) #4, !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i32]* %newBuffer, metadata !39, metadata !DIExpression()), !dbg !43
  %4 = load i32, i32* %a, align 4, !dbg !44
  %cmp = icmp slt i32 %4, 0, !dbg !46
  br i1 %cmp, label %if.then, label %lor.lhs.false, !dbg !47

lor.lhs.false:                                    ; preds = %entry
  %5 = load i32, i32* %a, align 4, !dbg !48
  %cmp5 = icmp sge i32 %5, 128, !dbg !49
  br i1 %cmp5, label %if.then, label %if.else, !dbg !50

if.then:                                          ; preds = %lor.lhs.false, %entry
  %6 = load i32, i32* %b, align 4, !dbg !51
  %idxprom = sext i32 %6 to i64, !dbg !53
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %newBuffer, i64 0, i64 %idxprom, !dbg !53
  store i32 1, i32* %arrayidx, align 4, !dbg !54
  br label %if.end, !dbg !55

if.else:                                          ; preds = %lor.lhs.false
  %7 = load i32, i32* %b, align 4, !dbg !56
  %idxprom7 = sext i32 %7 to i64, !dbg !58
  %arrayidx8 = getelementptr inbounds [50 x i32], [50 x i32]* %newBuffer, i64 0, i64 %idxprom7, !dbg !58
  store i32 1, i32* %arrayidx8, align 4, !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load i32, i32* %retval, align 4, !dbg !60
  ret i32 %8, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local i32 @__isoc99_scanf(i8*, ...) #3

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #2

; Function Attrs: nounwind
declare dso_local i32 @__isoc99_sscanf(i8*, i8*, ...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_23-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 7, type: !13, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_23-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!13 = !DISubroutineType(types: !3)
!14 = !DILocalVariable(name: "buffer", scope: !11, file: !12, line: 8, type: !15)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocation(line: 8, column: 8, scope: !11)
!18 = !DILocation(line: 8, column: 17, scope: !11)
!19 = !DILocalVariable(name: "ch", scope: !11, file: !12, line: 9, type: !16)
!20 = !DILocation(line: 9, column: 7, scope: !11)
!21 = !DILocation(line: 10, column: 5, scope: !11)
!22 = !DILocalVariable(name: "a", scope: !11, file: !12, line: 11, type: !4)
!23 = !DILocation(line: 11, column: 6, scope: !11)
!24 = !DILocation(line: 11, column: 15, scope: !11)
!25 = !DILocation(line: 11, column: 10, scope: !11)
!26 = !DILocation(line: 13, column: 11, scope: !11)
!27 = !DILocation(line: 13, column: 43, scope: !11)
!28 = !DILocation(line: 13, column: 2, scope: !11)
!29 = !DILocalVariable(name: "nb", scope: !11, file: !12, line: 15, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 80, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 10)
!33 = !DILocation(line: 15, column: 7, scope: !11)
!34 = !DILocalVariable(name: "b", scope: !11, file: !12, line: 16, type: !4)
!35 = !DILocation(line: 16, column: 9, scope: !11)
!36 = !DILocation(line: 17, column: 12, scope: !11)
!37 = !DILocation(line: 17, column: 29, scope: !11)
!38 = !DILocation(line: 17, column: 5, scope: !11)
!39 = !DILocalVariable(name: "newBuffer", scope: !11, file: !12, line: 19, type: !40)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 19, column: 6, scope: !11)
!44 = !DILocation(line: 20, column: 5, scope: !45)
!45 = distinct !DILexicalBlock(scope: !11, file: !12, line: 20, column: 5)
!46 = !DILocation(line: 20, column: 7, scope: !45)
!47 = !DILocation(line: 20, column: 11, scope: !45)
!48 = !DILocation(line: 20, column: 14, scope: !45)
!49 = !DILocation(line: 20, column: 16, scope: !45)
!50 = !DILocation(line: 20, column: 5, scope: !11)
!51 = !DILocation(line: 21, column: 13, scope: !52)
!52 = distinct !DILexicalBlock(scope: !45, file: !12, line: 20, column: 24)
!53 = !DILocation(line: 21, column: 3, scope: !52)
!54 = !DILocation(line: 21, column: 16, scope: !52)
!55 = !DILocation(line: 22, column: 2, scope: !52)
!56 = !DILocation(line: 24, column: 13, scope: !57)
!57 = distinct !DILexicalBlock(scope: !45, file: !12, line: 23, column: 7)
!58 = !DILocation(line: 24, column: 3, scope: !57)
!59 = !DILocation(line: 24, column: 16, scope: !57)
!60 = !DILocation(line: 26, column: 1, scope: !11)
